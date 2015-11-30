module Cloudat
  module Dsl
    class Plan
      include Cloudat::Configurable
      include Cloudat::Dsl::Schedule

      def initialize(cfg = nil)
        @config = cfg
        init_dsl
      end

      def execute
        plan_file = config.plan
        puts "Running Cloudat on #{plan_file}#{" (dry-run)" if dry_run?}"

        plan_content = File.read(plan_file)
        instance_eval(plan_content, plan_file)
      end

      def define_action_method(act)
        m_name = act.to_s.gsub(/^action_/, '')
        return if respond_to?(m_name) # Method already exists
        logger.debug("Defining action method: #{m_name}")
        begin
          instance_eval(<<-EOM, __FILE__, __LINE__ + 1)
            def #{m_name}(*args, &block)
              send_action_method(#{act.inspect}, *args, &block)
            end
          EOM
        rescue SyntaxError
          define_method(m_name.to_sym) do |*args, &block|
            send_action_method(act, *args, &block)
          end
        end
      end

      def define_resource_method(res)
        r_name = res.dsl_name
        return if respond_to?(r_name) # Method already exists
        logger.debug("Defining resource method: #{r_name}")
        begin
          instance_eval(<<-EOM, __FILE__, __LINE__ + 1)
            def #{r_name}(identifier)
              #{res}.new(config, identifier)
            end
          EOM
        rescue SyntaxError
          define_method(r_name.to_sym) do |identifier|
            res.new(config, identifier)
          end
        end
      end

      def define_resources_method(res)
        r_name = "#{res.dsl_name}s"
        return if respond_to?(r_name) # Method already exists
        logger.debug("Defining resources method: #{r_name}")
        begin
          instance_eval(<<-EOM, __FILE__, __LINE__ + 1)
            def #{r_name}(*options)
              #{res}.builder(config, *options)
            end
          EOM
        rescue SyntaxError
          define(r_name.to_sym) do |*options|
            res.builder(config, identifier)
          end
        end
      end

      def init_dsl
        config.action_methods.each { |act| define_action_method(act) }
        config.resource_classes.each do |res|
          define_resource_method(res)
          define_resources_method(res)
        end
        config.schedule_methods.each { |sch| define_schedule_method(sch) }
      end

      def provider(prov)
        logger.info("Loading provider: #{prov}")
        config.load_provider(prov.to_s)
        init_dsl
      end

      def dry_run?
        config.dry_run?
      end

      def send_action_method(action, resources)
        logger.debug("Sending action: #{action} on #{resources.inspect}")

        Array(resources).each do |resource|
          # Stop here if we're in dry-run
          logger.info("Would have executed #{action} on #{resource}") if dry_run?
          next if dry_run?

          if resource.is_a?(Array)
            resource.each(&action)
          else
            resource.send(action)
          end
        end
      end
    end
  end
end

module Cloudat
  module Dsl
    module ResourceDsl
      def add_resource_dsl(resource_klass)
        dsl_name = resource_klass.resource_name
        begin
          instance_eval(<<-EOM, __FILE__, __LINE__ + 1)
            def #{dsl_name}(identifier)
              resource_eval(#{resource_klass}, identifier)
            end
          EOM
        rescue SyntaxError
          # TODO: add support for blocks
          define_method(dsl_name.to_sym) do |identifier|
            resource_eval(resource_klass, identifier)
          end
        end
      end

      def remove_action_dsl(resource_klass)
        dsl_name = resource_klass.resource_name
        remove_method(dsl_name) if method_defined?(dsl_name)
      end

      def resource_eval(resource_klass, identifier)
        res = resource_klass.new(config, identifier)
        add_resource(res) if respond_to?(:add_resource)
        res
      end
    end
  end
end

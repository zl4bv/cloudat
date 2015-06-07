module Cloudat
  module Dsl
    module ActionDsl
      def add_action_dsl(action_klass)
        dsl_name = action_klass.action_name
        begin
          instance_eval(<<-EOM, __FILE__, __LINE__ + 1)
            def #{dsl_name}(res, &block)
              action_eval(#{action_klass}, res, &block)
            end
          EOM
        rescue SyntaxError
          # TODO: add support for blocks
          define_method(dsl_name.to_sym) do |res, &block|
            action_eval(action_klass, res, &block)
          end
        end
      end

      def remove_action_dsl(action_klass)
        dsl_name = action_klass.action_name
        remove_method(dsl_name) if method_defined?(dsl_name)
      end

      def action_eval(action_klass, res, &block)
        act = action_klass.new(res, config)
        unless block.nil?
          child_cxt = Cloudat::Dsl::ActionContext.new(act, config)
          child_cxt.instance_eval(&block)
        end
        add_action(act)
        act
      end
    end
  end
end

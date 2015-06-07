module Cloudat
  module Dsl
    module EventDsl
      def add_event_dsl(event_klass)
        dsl_name = event_klass.event_name
        begin
          instance_eval(<<-EOM, __FILE__, __LINE__ + 1)
            def #{dsl_name}(name, &block)
              event_eval(#{event_klass}, name, &block)
            end
          EOM
        rescue SyntaxError
          define_method(dsl_name.to_sym) do |name, &block|
            event_eval(event_klass, name, &block)
          end
        end
      end

      def remove_event_dsl(event_klass)
        dsl_name = event_klass.event_name
        remove_method(dsl_name) if method_defined?(dsl_name)
      end

      def event_eval(event_klass, name, &block)
        evt = event_klass.new(name, config)
        child_cxt = Cloudat::Dsl::EventContext.new(evt, config)
        child_cxt.instance_eval(&block)
        add_event(evt)
        evt
      end
    end
  end
end

module Cloudat
  module Dsl
    class PlanContext < Cloudat::Dsl::BaseContext
      include Cloudat::Dsl::ProviderDsl
      include Cloudat::Dsl::EventDsl

      def self.method_missing(method_sym, *args, &block)
        method_s = method_sym.to_s
      end

      def init_dsl
        config.event_classes.each { |klass| add_event_dsl(klass) }
      end

      def plan_eval(file)
        if file.is_a?(String)
          data = file
        elsif file.is_a?(IO)
          data = IO.read
        else
          fail 'Could not read plan'
        end

        instance_eval(data)
      end

      def events
        @events ||= []
      end

      def add_event(evt)
        events << evt
      end
    end
  end
end

module Cloudat
  module Dsl
    class EventContext < Cloudat::Dsl::BaseContext
      include Cloudat::Dsl::ActionDsl
      include Cloudat::Dsl::ResourceDsl

      attr_reader :event

      def initialize(event, config = nil)
        @event = event
        super(config)
      end

      def init_dsl
        config.action_classes.each { |klass| add_action_dsl(klass) }
        config.resource_classes.each { |klass| add_resource_dsl(klass) }
      end

      def add_action(act)
        @event.add_action(act)
      end
    end
  end
end

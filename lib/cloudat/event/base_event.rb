module Cloudat
  module Event
    class BaseEvent
      include Cloudat::Configurable
      extend Cloudat::Dsl::DslName

      Event.register(self)

      attr_accessor :name
      attr_reader :actions

      # Gets the name of the class formatted in a way that can be consumed
      # by the DSL.
      # @deprecated Use {#dsl_name} instead
      def self.event_name
        dsl_name
      end

      def initialize(name, config = nil)
        @name = name
        @config = config
        @actions = []
      end

      def add_action(action)
        @actions << action
      end

      def execute
        actions.each(&:execute)
      end
    end
  end
end

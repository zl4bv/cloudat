module Cloudat
  module Action
    class BaseAction
      include Cloudat::Configurable
      extend Cloudat::Dsl::DslName

      Action.register(self)

      # Gets the name of the class formatted in a way that can be consumed
      # by the DSL.
      # @deprecated Use {#dsl_name} instead
      def self.action_name
        dsl_name
      end

      def initialize(res, config = nil)
        add_resource(res)
        @config = config
      end

      def resources
        @resources ||= []
      end

      def add_resource(res)
        resources << res
      end
    end
  end
end

module Cloudat
  module Dsl
    class ActionContext < Cloudat::Dsl::BaseContext
      include Cloudat::Dsl::ResourceDsl

      attr_reader :action

      def initialize(action, config = nil)
        @action = action
        super(config)
      end

      def init_dsl
        config.resource_classes.each { |klass| add_resource_dsl(klass) }
      end

      def add_resource(res)
        action.add_resource(res)
      end
    end
  end
end

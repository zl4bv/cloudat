module Cloudat
  module Action
    # Register the action class
    # @param active_class [Class] action class to register
    def self.register(action_class)
      Loader.actions << action_class
    end

    def self.load_provider(provider)
      require "cloudat/action/#{provider}"
    end

    class Loader
      def self.actions
        @actions ||= []
      end

      # For now we include all actions, but we could change this later
      def actions
        Loader.actions
      end
    end
  end
end


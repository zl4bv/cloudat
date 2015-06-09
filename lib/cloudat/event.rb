module Cloudat
  module Event
    # Register the event class
    # @param event_class [Class] event class to register
    def self.register(event_class)
      Loader.events << event_class
    end

    class Loader
      def self.events
        @resources ||= []
      end

      # For now we include all events, but we could change this later
      def events
        Loader.events
      end
    end
  end
end

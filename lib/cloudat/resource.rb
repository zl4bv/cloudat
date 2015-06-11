module Cloudat
  module Resource
    # Register the resource class
    # @param resource_class [Class] resource class to register
    # @param actions [Symbol, ...] one or more actions to be registered
    #   to the specified resource
    def self.register(resource_class, *args)
      puts 'Supplying actions to .register is deprecated.' if args.length > 0
      Loader.resources[resource_class] = resource_class.actions
    end

    class Loader
      def self.actions
        resources.values.flatten.uniq
      end

      def actions
        Loader.actions
      end

      def self.resources
        @resources ||= {}
      end

      # For now we include all resources, but we could change this later
      def resources
        Loader.resources.keys
      end
    end
  end
end

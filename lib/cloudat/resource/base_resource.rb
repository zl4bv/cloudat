module Cloudat
  module Resource
    class BaseResource
      include Cloudat::Configurable
      extend Cloudat::Dsl::DslName

      Resource.register(self, :noop)

      attr_accessor :identifier

      # Gets the name of the class formatted in a way that can be consumed
      # by the DSL.
      # @deprecated Use {#dsl_name} instead
      def self.resource_name
        dsl_name
      end

      def initialize(cfg, id)
        @config = cfg
        @identifier = id
      end

      def to_s
        "#{dsl_name} #{identifier}"
      end

      # Dummy action. Useful for testing purposes.
      def noop
        logger.info("#{self} did nothing (noop action)")
      end

    end
  end
end

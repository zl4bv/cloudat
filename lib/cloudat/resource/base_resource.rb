module Cloudat
  module Resource
    class BaseResource
      include Cloudat::Configurable
      extend Cloudat::Dsl::DslName

      attr_accessor :identifier

      def self.actions
        instance_methods.select { |method| method.to_s.start_with?('action_') }
      end

      # Used to build multiple resources at once.
      # @param config [Cloudat::Configuration] Application configuration
      # @param options [Array] Options that can be used to filter a collection
      #   of resources
      # @return [Array<Cloudat::Resource::BaseResource] List of resources that
      #   match the supplied options
      def self.builder(config, *options)
        logger.error("#{self} does not support building multiple resources")
      end

      def initialize(cfg, id)
        @config = cfg
        @identifier = id
      end

      def to_s
        "#{self.class.dsl_name} #{identifier}"
      end

      # Dummy action. Useful for testing purposes.
      def action_noop
        logger.info("#{self} did nothing (noop action)")
      end

      Resource.register(self)
    end
  end
end

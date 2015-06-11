module Cloudat
  module Resource
    class BaseResource
      include Cloudat::Configurable
      extend Cloudat::Dsl::DslName

      attr_accessor :identifier

      def self.actions
        instance_methods.select { |method| method.to_s.start_with?('action_') }
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

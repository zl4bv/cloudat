module Cloudat
  # A mixin for configuration-related behaviour
  module Configurable
    private

    attr_writer :config
    attr_writer :logger

    # @return [Cloudat::Configuration] new or existing configuration instance
    def config
      @config ||= Cloudat::Configuration.new
    end

    # @return [Logger] new or existing logger instance
    def logger
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end

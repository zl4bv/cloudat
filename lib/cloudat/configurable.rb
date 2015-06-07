module Cloudat
  # A mixin for configuration-related behaviour
  module Configurable
    private

    attr_reader :config

    def init_config(config = nil)
      @config = config || Cloudat::Configuration.new
    end
  end
end


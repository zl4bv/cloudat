module Cloudat
  class Configuration
    def initialize(options = {})
      @options = options
    end

    def plan
      @options[:plan]
    end

    def dry_run?
      @options[:dry_run]
    end

    def init_logger(*args)
      args << STDOUT if args.empty?
      logger = ::Logger.new(*args)
      logger.level = ::Logger::INFO
      logger
    end

    def action_methods
      resource_loader.actions
    end

    def resource_classes
      resource_loader.resources
    end

    def resource_loader
      @resource_loader ||= Cloudat::Resource::Loader.new
    end

    def schedule_methods
      %w(at cron every in)
    end

    def load_provider(provider)
      require "cloudat/#{provider}"
    end
  end
end

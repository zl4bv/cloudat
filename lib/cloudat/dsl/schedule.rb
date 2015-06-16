module Cloudat
  module Dsl
    # Mixin that provides DSL methods for scheduling tasks.
    module Schedule
      attr_writer :scheduler

      # Creates a new instance method named after the name parameter. Calls the
      # method of the same name on an instance of the scheduler class.
      # @param name [String] Name of the method to create
      def define_schedule_method(name)
        return if respond_to?(name.to_sym)
        logger.debug("Defining schedule method: #{name}")
        self.class.send(:define_method, name.to_sym) do |*args, &block|
          scheduler.send(name.to_sym, *args, &block)
        end
      end

      # Returns an instance of the scheduler class. Instantiates a new instance
      # if no existing instance.
      # @return [Rufus::Scheduler] Instance of the scheduler class
      def scheduler
        @scheduler || Rufus::Scheduler.new
      end
    end
  end
end

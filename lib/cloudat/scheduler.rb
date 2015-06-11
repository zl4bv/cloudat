module Cloudat
  class Scheduler
    # @api private
    attr_reader :events

    # @param events [Array<Cloudat::Event::BaseEvent] Events to schedule
    def initialize(events)
      @events = events
    end

    # Calculates when actions should next run
    # @return [Array<Hash<Cloudat::Action::BaseAction,Time>>] List of actions and the
    #   time at which the actions are next scheduled to run. Sorted in
    # chronological order.
    def schedule
      actions = []
      events.each do |event|
        triggers = default_triggers.merge(event.triggers)
        time = next_time(triggers)
        event.actions.each { |action| actions << { action: action, time: time } }
      end
      # TODO: nested events
      actions.sort { |pair1, pair2| pair1[:time] <=> pair2[:time] }
    end

    private

    def default_triggers
      {hours: 0, minutes: 0, seconds: 0}
    end

    # Calculate next day on which an action can run
    # @param triggers [Hash] days/time that should trigger the schedule
    # @return [Time] Time that action can next run
    def next_time(triggers)
      hours = triggers[:hours]
      minutes = triggers[:minutes]
      seconds = triggers[:seconds]
      next_t = Time.parse("#{hours}:#{minutes}:#{seconds}")

      unless triggers.key?(:wdays)
        next_t += (60 * 60 * 24) if next_t < Time.now # tomorrow
        return next_t
      end

      day_offset = next_wday(triggers[:wdays])
      next_t += (60 * 60 * 24 * day_offset) if day_offset > 0
      next_t
    end

    # @param triggers [Array] Weekday numbers that schedule can run on
    # @return [Fixnum] The number of days between today and the next scheduled
    #   day
    def next_wday(wdays)
      wdays = wdays.dup.sort
      today = Time.now.wday

      # Any trigger days on earlier days of the week will next trigger next
      # week
      wdays.map! { |wday| wday < today ? wday + 7 : wday }
      wdays.sort.first - today
    end
  end
end

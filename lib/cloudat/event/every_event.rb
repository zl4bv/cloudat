module Cloudat
  module Event
    class EveryEvent < Cloudat::Event::BaseEvent
      Event.register(self)
    end
  end
end

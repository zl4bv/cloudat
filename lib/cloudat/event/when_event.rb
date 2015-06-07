module Cloudat
  module Event
    class WhenEvent < Cloudat::Event::BaseEvent
      Event.register(self)
    end
  end
end

module Cloudat
  module Event
    class AtEvent < Cloudat::Event::BaseEvent
      Event.register(self)
    end
  end
end

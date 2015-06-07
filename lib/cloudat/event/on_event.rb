module Cloudat
  module Event
    class OnEvent < Cloudat::Event::BaseEvent
      Event.register(self)
    end
  end
end

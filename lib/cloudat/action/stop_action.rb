module Cloudat
  module Action
    class StopAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:stop)
      end
    end
  end
end

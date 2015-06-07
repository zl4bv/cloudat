module Cloudat
  module Action
    class SuspendAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:suspend)
      end
    end
  end
end

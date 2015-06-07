module Cloudat
  module Action
    class TerminateAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:terminate)
      end
    end
  end
end

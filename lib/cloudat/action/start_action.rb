module Cloudat
  module Action
    class StartAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:start)
      end
    end
  end
end

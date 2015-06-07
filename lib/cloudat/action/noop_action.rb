module Cloudat
  module Action
    class NoopAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:noop)
      end
    end
  end
end

module Cloudat
  module Action
    class CreateAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:create)
      end
    end
  end
end

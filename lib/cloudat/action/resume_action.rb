module Cloudat
  module Action
    class ResumeAction < Cloudat::Action::BaseAction
      Action.register(self)

      def execute
        resources.each(&:resume)
      end
    end
  end
end

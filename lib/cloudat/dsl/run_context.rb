module Cloudat
  module Dsl
    class RunContext
      def events
        @events ||= {}
      end
    end
  end
end


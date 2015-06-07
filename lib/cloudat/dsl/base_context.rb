module Cloudat
  module Dsl
    class BaseContext
      include Cloudat::Configurable

      def initialize(config = nil)
        init_config(config)
        init_dsl
      end

      def init_dsl
        # Implemented by child classes
      end
    end
  end
end

module Cloudat
  module Dsl

    # FIXME: Not used; please delete
    class BaseDsl
      include Cloudat::Configurable

      def initialize(config = nil)
        init_config(config)
      end
    end
  end
end

module Cloudat
  module Dsl
    module ProviderDsl
      # Loads a provider
      def provider(prov)
        puts "Loading provider '#{prov}'"
        config.load_provider(prov.to_s)
      end

      alias_method :load_provider, :provider
    end
  end
end

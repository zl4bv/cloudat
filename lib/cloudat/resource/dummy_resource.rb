module Cloudat
  module Resource
    class DummyResource < Cloudat::Resource::BaseResource
      include Cloudat::Configurable
      Resource.register(self, :noop)
    end
  end
end

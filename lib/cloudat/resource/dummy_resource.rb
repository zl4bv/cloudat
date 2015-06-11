module Cloudat
  module Resource
    class DummyResource < Cloudat::Resource::BaseResource
      include Cloudat::Configurable
      Resource.register(self)
    end
  end
end

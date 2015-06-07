module Cloudat
  module Resource
    class BaseResource
      include Cloudat::Configurable

      Resource.register(self, :noop)

      def self.resource_name
        class_name = self.underscore(self.name)
        class_name = class_name.split('/').last if class_name.include?('/')
        class_name.gsub(/_resource$/, '')
      end

      # activesupport/lib/active_support/inflector/methods.rb, line 48
      def self.underscore(camel_cased_word)
        word = camel_cased_word.to_s.dup
        word.gsub!(/::/, '/')
        word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
        word.tr!('-', '_')
        word.downcase!
        word
      end

      def initialize(config, *_args)
        init_config(config)
      end

      def noop
        puts "Noop action executed on #{self}"
      end
    end
  end
end

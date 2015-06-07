module Cloudat
  module Action
    class BaseAction
      include Cloudat::Configurable

      Action.register(self)

      def self.action_name
        class_name = self.underscore(self.name)
        class_name = class_name.split('/').last if class_name.include?('/')
        class_name.gsub(/_action$/, '')
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

      def initialize(res, config = nil)
        add_resource(res)
        init_config(config)
      end

      def resources
        @resources ||= []
      end

      def add_resource(res)
        resources << res
      end
    end
  end
end

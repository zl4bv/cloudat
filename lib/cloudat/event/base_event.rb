module Cloudat
  module Event
    class BaseEvent
      include Cloudat::Configurable

      Event.register(self)

      attr_accessor :name
      attr_reader :actions

      def self.event_name
        class_name = self.underscore(self.name)
        class_name = class_name.split('/').last if class_name.include?('/')
        class_name.gsub(/_event$/, '')
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

      def initialize(name, config = nil)
        @name = name
        @actions = []
        init_config(config)
      end

      def add_action(action)
        @actions << action
      end

      def execute
        actions.each(&:execute)
      end
    end
  end
end

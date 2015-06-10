module Cloudat
  module Dsl
    # Mixin that providers helper methods for describing a class. Used
    # by the DSL to generate nice method names for each class.
    module DslName

      # Converts camel-cased class name to a lowercase string with underscores
      # intead of spaces.
      # @param strip_last_word [Boolean] If true, will strip the last word
      #   from the output e.g. if the output is expected to be
      #   'my_custom_resource' then it will become 'my_custom'
      # @return [String] lowercase string with underscores between
      def dsl_name(strip_last_word = true)
        class_name = underscore(name)
        class_name = class_name.split('/').last if class_name.include?('/')
        class_name.gsub!(/_[A-Za-z0-9]+$/, '') if strip_last_word
        class_name
      end

      private

      # activesupport/lib/active_support/inflector/methods.rb, line 48
      def underscore(camel_cased_word)
        word = camel_cased_word.to_s.dup
        word.gsub!(/::/, '/')
        word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
        word.tr!('-', '_')
        word.downcase!
        word
      end

    end
  end
end

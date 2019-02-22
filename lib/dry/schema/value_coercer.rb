require 'dry/equalizer'
require 'dry/initializer'

module Dry
  module Schema
    # Used by the processors to coerce values in the input hash
    #
    # @api private
    class ValueCoercer
      extend Dry::Initializer
      include ::Dry::Equalizer(:type_schema)

      # @api private
      param :type_schema

      # @api private
      def call(input)
        if input.success?
          type_schema[Hash(input)]
        else
          type_schema.name_key_map.reduce(EMPTY_HASH.dup) do |hash, (name, type)|
            hash[name] = input.error?(name) ? input[name] : type[input[name]]
            hash
          end
        end
      end
    end
  end
end

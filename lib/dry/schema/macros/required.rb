# frozen_string_literal: true

require 'dry/schema/macros/key'

module Dry
  module Schema
    module Macros
      # A Key specialization used for keys that must be present
      #
      # @api public
      class Required < Key
        # @api private
        def operation
          :and
        end
      end
    end
  end
end

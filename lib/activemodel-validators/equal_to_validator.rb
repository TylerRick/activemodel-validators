require 'activemodel-validators/less_or_greater_than_validator'

module ActiveModel
  module Validations
    class EqualToValidator < LessOrGreaterThanValidator
    protected
      def default_operator
        :==
      end

      def allowed_operators
        [:==]
      end
    end
  end
end

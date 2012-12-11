require 'activemodel-validators/greater_than_validator'

module ActiveModel
  module Validations
    class AtLeastValidator < GreaterThanValidator
    protected
      def default_operator
        :>=
      end
      def operator_text
        options[:operator_text] || 'at least' || super
      end
    end
  end
end


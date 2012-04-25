module ActiveModel
  module Validations
    class GreaterThanValidator < LessOrGreaterThanValidator
    protected
      def default_operator
        :>
      end

      def allowed_operators
        [:>, :>=]
      end
    end
  end
end

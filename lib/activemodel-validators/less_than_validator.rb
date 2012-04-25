module ActiveModel
  module Validations
    class LessThanValidator < LessOrGreaterThanValidator
    protected
      def default_operator
        :<
      end

      def allowed_operators
        [:<, :<=]
      end
    end
  end
end

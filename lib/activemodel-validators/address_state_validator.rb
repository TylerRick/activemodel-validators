module ActiveModel
  module Validations
    class AddressStateValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.blank?
        unless value.match /\A^[A-Z ]{2,}\z/i
          record.errors.add attribute, :state_invalid
        end
      end
    end
  end
end

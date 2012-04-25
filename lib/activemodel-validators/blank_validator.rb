module ActiveModel
  module Validations
    class BlankValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless value.blank?
          record.errors.add attribute, options[:message] || :must_be_blank
        end
      end
    end
  end
end

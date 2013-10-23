module ActiveModel
  module Validations
    class YearValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.blank?
        unless (min .. max).include? value
          record.errors.add attribute, :year_invalid, min: min, max: max
        end
      end

    private
      def min
        options[:min] || 1700
      end

      def max
        options[:max] || 2200
      end
    end
  end
end

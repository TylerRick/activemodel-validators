module ActiveModel
  module Validations
    class SumOfValidator < ActiveModel::EachValidator
      def check_validity!
        unless options[:attr_names]
          raise ArgumentError, "must supply :attr_names option"
        end
      end

      def validate_each(record, attribute, value)
        addends = options[:attr_names].map {|_| record[_] }
        return if value.blank?
        sum = addends.reject(&:blank?).sum
        unless value == sum
          record.errors.add(attribute, options[:message] || :sum_of,
                            options.merge(
                              attr_names: options[:attr_names].to_sentence,
                              addends: addends.join(' + '),
                              sum: sum,
                              value: value,
                            )
          )
        end
      end
    end
  end
end

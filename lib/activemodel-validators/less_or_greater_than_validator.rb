module ActiveModel
  module Validations
    class LessOrGreaterThanValidator < ActiveModel::EachValidator
      def check_validity!
        unless options[:attr] or options[:value]
          # TODO: If options[:attr], check that it is an actual column or virtual attribute
          raise ArgumentError, "must supply :attr or :value option"
        end
        unless allowed_operators.include?(operator)
          # TODO: If options[:attr], check that it is an actual column or virtual attribute
          raise ArgumentError, ":operator must be one of #{allowed_operators.join(', ')} but was #{operator}"
        end
      end

    protected
      def default_operator
        raise NotImplementedError, 'must be defined in subclass'
      end

      def allowed_operators
        [:<, :<=, :>, :>=, :==]
      end

      def operator
        options[:operator] || default_operator
      end

      # Defaults to the standard mathematical name for these operators, but you're free to override with
      # something that makes more sense ('later than' might make more sense for dates, for example)
      def operator_text
        options[:operator_text] ||
        {
          :<  => 'less than',
          :<= => 'less than or equal to',
          :>  => 'greater than',
          :>= => 'greater than or equal to',
          :== => 'equal to',
        }[operator]
      end

      # The value we're comparing against.
      # If we're comparing to another attribute, options[:attr] must be a symbol.
      # Otherwise, options[:value] may be any comparable value (number, date).
      def other_value
        if comparing_to_attr?
          @record.send options[:attr]
        else
          options[:value]
        end
      end

      def comparing_to_attr?
        !!options[:attr]
      end

      def human_attr_name
        return unless options[:attr]
        if defined?(ActiveRecord::Base)
          ActiveRecord::Base.human_attribute_name(options[:attr])
        else
          options[:attr]
        end
      end

      def message_key
        comparing_to_attr? ? :less_or_greater_than_attr : :less_or_greater_than
      end

    public

      def validate_each(record, attribute, value)
        @record = record
        return if value.blank? or other_value.blank?
        unless value.send(operator, other_value)
          record.errors.add(attribute, message_key,
                            **options.merge(
                              value:         value,
                              operator:      operator,
                              operator_text: operator_text,
                              attr_name:     human_attr_name,
                              other_value:   other_value,
                            )
          )
        end
      end
    end
  end
end

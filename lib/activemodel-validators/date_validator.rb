module ActiveModel
  module Validations
    class DateValidator < ActiveModel::EachValidator
      def validate_each(record, attr_name, value)
        before_type_cast = "#{attr_name}_before_type_cast"
        raw_value = record.send(before_type_cast) if record.respond_to?(before_type_cast.to_sym)
        #puts "raw_value=#{raw_value.inspect} (#{raw_value.class}), value=#{value.inspect} (#{value.class})"
        raw_value ||= value

        if raw_value.present? and !value.is_a?(Date)
          record.errors.add attr_name, :date_invalid
          return # don't want it to show *both* errors (:date_invalid and :blank)
        end

        if options[:required] && value.blank?
          message = (options[:required] == true ? :blank : options[:required])
          record.errors.add attr_name, message
        end
      end
    end
  end
end

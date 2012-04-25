module ActiveModel
  module Validations
    class BooleanPresenceValidator < ActiveModel::EachValidator
      # You can't use validates :presence for boolean attributes!
      # You could do this instead:
      #   validates_inclusion_of :attr, :in => [true, false]
      # but the main reason to use this validator instead of is that the error message is better ("not
      # in list? what list?") and the meaning is clearer when reading the code (we're validating the
      # presence of a boolean attribute -- true or false).
      def validate_each(record, attribute, value)
        unless [true, false].include? value
          record.errors.add attribute, :blank
        end
      end
    end
  end
end

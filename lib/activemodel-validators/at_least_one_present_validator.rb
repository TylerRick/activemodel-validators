module ActiveModel
  module Validations
    class AtLeastOnePresentValidator < ActiveModel::Validator
      def validate(record)
        attr_names = options[:at_least_one_of]
        #puts %(attr_names=#{attr_names.inspect})
        unless attr_names.map {|attr_name| record[attr_name]}.any?(&:present?)
          record.errors.add :base, options[:message] || "at least 1 of these fields must be present: #{attr_names.to_sentence(last_word_connector: ', or ')}"
        end
      end
    end
  end
end

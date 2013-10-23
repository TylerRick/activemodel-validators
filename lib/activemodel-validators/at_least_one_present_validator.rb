module ActiveModel
  module Validations
    class AtLeastOnePresentValidator < ActiveModel::Validator
      def validate(record)
        attr_names = options[:at_least_one_of]
        #puts %(attr_names=#{attr_names.inspect})
        unless attr_names.map {|attr_name| record[attr_name]}.any?(&:present?)
          record.errors.add :base, options[:message] || :at_least_one_field_must_be_present,
            attr_names_list: attr_names.to_sentence(two_words_connector: ' or ', last_word_connector: ', or ')
        end
      end
    end
  end
end

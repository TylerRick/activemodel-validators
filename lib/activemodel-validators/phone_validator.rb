class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value.to_s.gsub(/[\s-]+/, '').length >= 10
      record.errors.add attribute, "must have at least 10 digits"
    end
  end
end

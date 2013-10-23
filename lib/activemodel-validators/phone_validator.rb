class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value.to_s.gsub(/[\s-]+/, '').length >= 10
      record.errors.add attribute, :must_have_at_least_10_digits
    end
  end
end

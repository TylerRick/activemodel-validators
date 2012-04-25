class PostalCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    if value.to_s.length < 5
      record.errors.add attribute, :postal_code_too_short
    end
  end
end

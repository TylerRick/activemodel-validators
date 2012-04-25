class YearValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless ((min=1700) .. (max=2200)).include? value
      record.errors.add attribute, :year_invalid, min: min, max: max
    end
  end
end

class MultipleOfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    #tolerance = options[:tolerance] || 0.00001
    #puts %(#{value} % #{options[:of]}=#{(value % options[:of]).inspect})

    #unless BigDecimal.new(value) % BigDecimal.new(options[:of]) <= tolerance
    begin
      unless BigDecimal.new(value.to_s) % BigDecimal.new(options[:of].to_s) == BigDecimal.new('0.0')
        record.errors.add attribute, :not_multiple_of, of: options[:of]
      end
    rescue
      puts "#{$!} for either #{value.inspect} or #{options[:of].inspect}"
      return
    end
  end
end


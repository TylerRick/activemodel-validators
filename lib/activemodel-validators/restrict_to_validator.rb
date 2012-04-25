class RestrictToValidator < ActiveModel::EachValidator
  ErrorMessage = "An object with the method #include? or a proc or lambda is required, " <<
                  "and must be supplied as the :allowed_options option of the configuration hash"

  def initialize(*args)
    super
    @allowed_options = options[:allowed_options]
  end

  def check_validity!
    unless [:include?, :call].any?{ |method| options[:allowed_options].respond_to?(method) }
      raise ArgumentError, ErrorMessage
    end
  end

  def allowed_options(record)
    @allowed_options.respond_to?(:call) ? @allowed_options.call(record) : @allowed_options
  end
  def allowed_options_string(record)
    allowed_options = allowed_options(record)
    if allowed_options.is_a?(Range)
      "#{allowed_options}"
    else
      allowed_options.to_sentence(last_word_connector: ', or ')
    end
  end

  def validate_each(record, attribute, value)
    allowed_options = allowed_options(record)
    inclusion_method = inclusion_method(allowed_options)
    unless allowed_options.send(inclusion_method, value)
      record.errors.add(attribute, :restrict_to,
                        options.except(:in).merge!(
                          value: value,
                          allowed_options: allowed_options_string(record)
                        )
      )
    end
  end


private

  # In Ruby 1.9 <tt>Range#include?</tt> on non-numeric ranges checks all possible values in the
  # range for equality, so it may be slow for large ranges. The new <tt>Range#cover?</tt>
  # uses the previous logic of comparing a value with the range endpoints.
  def inclusion_method(enumerable)
    enumerable.is_a?(Range) ? :cover? : :include?
  end

end

class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def validate_each(record, attribute_name, value)
    unless value =~ EMAIL_REGEX
      record.errors[attribute_name] << (options[:message] || "not a valid email")
    end
  end
end
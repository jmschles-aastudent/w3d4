class QuestionValidator < ActiveModel::EachValidator

  def validate_eaech(record, attribute_name, value)
    unless has_two_or_more_choices?
      record.errors[attribute_name] << (options[:message] || "not enough choices")
    end
  end

  def has_two_or_more_choices?
    choices.count > 1
  end
end
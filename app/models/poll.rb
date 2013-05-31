class Poll < ActiveRecord::Base
  attr_accessible :title, :user

  validates :title, :presence => true
  validates :user_id, :presence => true

  belongs_to :user, :class_name => User, :foreign_key => :user_id, :primary_key => :id
  has_many :questions, :class_name => Question, :foreign_key => :poll_id, :primary_key => :id

  def add_question(text, user_choices)
    question = Question.new( text: text, poll: self )
    c = []
    user_choices.each do |choice|
      c << {:valid_answer => choice}
    end
    question.choices.build(c)
    question.save!
  end
end

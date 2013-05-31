class Response < ActiveRecord::Base
  attr_accessible :choice, :user

  validates :choice_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :choice, :class_name => Choice, :foreign_key => :choice_id, :primary_key => :id
  belongs_to :user, :class_name => User, :foreign_key => :user_id, :primary_key => :id

  def question_already_answered?
    u = User.where(id: user_id).first
    c = Choice.where(id: choice_id).first
    q = Question.where(id: c.question_id).first
    u.responses.each do |answer|
      test_c = Choice.where(id: choice_id).first
      test_q = Question.where(id: test_c.question_id).first
      return true if q == test_q
    end

    false
  end


end

class User < ActiveRecord::Base
  attr_accessible :username, :email

  validates :username, :presence => true,
                       :length => { :in => 2..10 }
  validates :email, :presence => true,
                    :email => true

  has_many :polls, :class_name => Poll, :foreign_key => :user_id, :primary_key => :id
  has_many :questions, :through => :polls, :source => :questions
  has_many :responses, :class_name => Response, :foreign_key => :user_id, :primary_key => :id

  def create_poll(title)
    Poll.create( title: title, user: self )
  end

  def add_question(poll, text, *choices)
    poll.add_question(text, choices) if self == poll.user
  end

  def vote(question, choice)
    raise "Can't vote on your own poll" if question.poll.user == self
    question.make_response(choice, self)
  end

  def get_responses
    responses
  end

  def responses_count
    responses.count
  end

  def delete_question(question)
    question.destroy
  end

  def answered_polls
    polls = []
    responses.each do |response|
      choice_id = response.choice_id
      c = Choice.where(id: choice_id).first
      q = Question.where(id: c.question_id).first
      polls << Poll.where(id: q.poll_id).first
    end

    polls.uniq
  end
end

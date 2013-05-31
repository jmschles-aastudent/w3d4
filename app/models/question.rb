class Question < ActiveRecord::Base
  attr_accessible :text, :poll

  validates :text, :presence => true,
                   :length => { :in => 10..100 }
  validates :poll_id, :presence => true
  # Validate the choices count later

  belongs_to :poll, :class_name => Poll, :foreign_key => :poll_id, :primary_key => :id
  has_one :user, :through => :polls, :source => :user
  has_many :choices, :class_name => Choice, :foreign_key => :question_id, :primary_key => :id, :dependent => :destroy
  has_many :responses, :through => :choices, :source => :responses

  after_destroy :log_destroy_action

  def add_choice(choice)
    Choice.create( valid_answer: choice, question: self )
  end

  def get_results
    choices_with_counts = self
      .choices
      .select("choices.*, COUNT(*) AS responses_count")
      .joins(:responses)
      .group("choices.id")

    choices_with_counts.map do |choice|
      [choice.valid_answer, choice.responses_count]
    end
  end

  def log_destroy_action
    puts "Question obliterated."
  end

  def make_response(choice, user)
    #todo: question: self
    choice_object = Choice.where( valid_answer: choice).first
    p choice_object
    raise "invalid choice" unless valid_choices.include?(choice)
    Response.create(choice: choice_object, user: user)
  end

  def valid_choices
    choices.map do |choice|
      choice.valid_answer
    end
  end
end

class Poll < ActiveRecord::Base
  attr_accessible :title, :user

  validates :title, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
  has_many :questions
end

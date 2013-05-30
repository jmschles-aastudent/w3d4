class Question < ActiveRecord::Base
  attr_accessible :text, :poll

  validates :text, :presence => true,
                   :length => { :in => 10..100 }
  validates :poll_id, :presence => true

  belongs_to :poll
  belongs_to :user, :through => :poll
end

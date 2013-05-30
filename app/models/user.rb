class User < ActiveRecord::Base
  attr_accessible :username, :email

  validates :username, :presence => true,
                       :length => { :in => 2..10 }
  validates :email, :presence => true,
                    :email => true

  has_many :polls
  has_many :questions, :through => :polls
end

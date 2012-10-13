class Achievement < ActiveRecord::Base
  attr_accessible :counter, :got_it, :user
  belongs_to :user
  validates_presence_of :user

  LIST = []

  def self.check(user)
    raise NotImplementedError
  end
end

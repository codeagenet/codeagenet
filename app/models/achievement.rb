class Achievement < ActiveRecord::Base
  attr_accessible :counter, :got_it, :user
  belongs_to :user
  validates_presence_of :user

  def got_it?
    got_it
  end

  class << self
    def list
      [Achievement::ForeverAlone, Achievement::PublicPerson]
    end

    def check(user)
      raise NotImplementedError
    end
  end
end

class Achievement < ActiveRecord::Base
  attr_accessible :counter, :got_it, :user
  belongs_to :user
  validates_presence_of :user

  def got_it?
    got_it
  end

  class << self
    def list
      [Achievement::ForeverAlone, Achievement::PublicPerson, Achievement::Forker, Achievement::Friendly, Achievement::Stalker, Achievement::Githubbie, Achievement::Polyglot]
    end

    def image_path
      self::ImagePath
    end
    
    def title
      self::Title
    end

    def description
      self::Description
    end
  end
end

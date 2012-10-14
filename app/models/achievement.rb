class Achievement < ActiveRecord::Base
  attr_accessible :counter, :user
  belongs_to :user
  validates_presence_of :user

  def got_it?
    true
  end

  class << self
    def earn_achievement_for(user)
      create!(:user => user) if check(user)
    end

    def list
      [Achievement::ForeverAlone,
       Achievement::PublicPerson,
       Achievement::Forker,
       Achievement::Friendly,
       Achievement::Stalker,
       Achievement::Githubbie,
       Achievement::Polyglot,
       Achievement::Railsrumbler
      ]
    end

    def image_path
      self::ImagePath
    end
    
    def title
      self::Title
    end

    def bubble
      self::Bubble
    end

    def description
      self::Description
    end
  end
end

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
      [
        Achievement::ForeverAlone,
        Achievement::PublicPerson,
        Achievement::Forker,
        Achievement::Friendly,
        Achievement::Stalker,
        Achievement::Githubbie,
        Achievement::Polyglot,
        Achievement::Starrer
      ]
    end

    def list_hidden
      [
        Achievement::Railsrumbler
      ]
    end

    def list_all
      list + list_hidden
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

    def hidden?
      list_hidden.include?(self)
    end

    def top_users
      a = Achievement.select('count(id) as c, user_id').limit(5)
      a = a.group(:user_id).order('c').reverse

      a.map! { |b| {user: b.user, count: b.c}}
    end

    def recent
      Achievement.order(:created_at).limit(5)
    end
  end
end

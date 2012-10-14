class Achievement < ActiveRecord::Base
  attr_accessible :counter, :user
  belongs_to :user
  validates_presence_of :user

  def got_it?
    true
  end

  def description
    self.class.description
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
        Achievement::Starrer,
        Achievement::Railsuser,
        Achievement::Rubyist,
        Achievement::Daddy
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
      a = User.select('*, (select count(achievements.id) from achievements where achievements.user_id = users.id) as c')
      a = a.order('c desc').first(10)
      #a = Achievement.select('count(id) as c, user_id').first(10).group('user_id').order('c DESC')

      a.map! { |b| {user: b, count: b.c}}
    end

    def recent
      Achievement.order('created_at DESC').limit(10)
    end
  end
end

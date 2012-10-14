class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :authentications, :dependent => :delete_all

  def to_s
    name || nickname || email
  end

  # Auth
  def apply_omniauth auth
    self.gravatar = auth['info']['image']
    self.nickname = auth['info']['nickname']
    self.name = auth['info']['name']
    self.email = auth['info']['email']
    authentications.build(provider: auth['provider'], uid: auth['uid'], token: auth['credentials']['token'])
  end

  def token
    authentications.last.token
  end

  # Github related
  def github(api_token = nil)
    api_token = self.token if api_token.nil?
    @github ||= Github.new do |config|
      config.oauth_token = api_token
    end

    @github
  end

  # Achievements related
  has_many :achievements, :dependent => :delete_all

  def unearned_achievements
    list = Achievement.list

    self.achievements.each do |a|
      list.delete(a.class)
    end

    list
  end

  def earn_achievements
    earned = []

    unearned_achievements.each do |achievement|
      a = achievement.earn_achievement_for(self)

      earned.push a if a
    end

    unless earned.empty?
      self.achievements.reload
      AchievementMailer.creation(self, earned).deliver
    end

    self.achievements_fetched_at = Time.now
    self.save!

    earned
  end

  def async_earn_achievements
    Resque.enqueue(UserAchievements, self.id)
  end
end

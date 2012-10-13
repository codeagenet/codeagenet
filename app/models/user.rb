class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :authentications, :dependent => :delete_all

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
  has_many :achievements

  def unearned_achievements
    list = Achievement.list

    self.achievements.each do |a|
      list.delete(a.class) if a.got_it?
    end

    list
  end

  def earn_achievements
    earned = []

    unearned_achievements.each do |achievement|
      earned.push achievement.create!(:user => self, :got_it => true) if achievement.check(self)
    end

    self.achievements.reload if earned
    self.achievements_fetched_at = Time.now
    self.save!

    earned
  end

  def async_earn_achievements
    Resque.enqueue(UserAchievements, self.id)
  end
end

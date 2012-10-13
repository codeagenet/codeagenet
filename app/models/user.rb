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
    self.email = auth['extra']['raw_info']['email']
    authentications.build(provider: auth['provider'], uid: auth['uid'], token: auth['credentials']['token'])
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
end

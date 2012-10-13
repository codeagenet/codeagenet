class Achievement::Stalker < Achievement
  Title = 'Stalker'
  ImagePath = 'achievements/stalker.jpg'
  Description = 'User follows at least 10 users without mutual follows.'

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (following - followers).count >= 10
  end

end
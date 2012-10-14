class Achievement::Stalker < Achievement
  Title = 'Stalker'
  ImagePath = 'achievements/badge_stalker.png'
  Description = 'User follows at least 10 users without mutual follows.'
  Bubble = {
      right: 43,
      bottom: 119,
      orientation: :right
  };

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (following - followers).count >= 10
  end

end
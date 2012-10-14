class Achievement::Stalker < LeveledAchievement
  Title = 'Stalker'
  ImagePath = 'achievements/badge_stalker.png'
  Description = 'Follows at least ___ users without mutual follows.'
  Bubble = {
      right: 43,
      bottom: 119,
      orientation: :right
  };
  Levels = [2, 5, 7, 10]

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (following - followers).count
  end

end
class Achievement::Stalker < LeveledAchievement
  Title = '___ Stalker'
  ImagePath = 'achievements/badge_stalker.png'
  Description = 'Follows at least ___ users without mutual follows.'
  Bubble = {
      right: 43,
      bottom: 119,
      orientation: :right
  };
  Levels = [5, 20, 40, 100]

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (following - followers).count
  end

end
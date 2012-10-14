class Achievement::Friendly < LeveledAchievement
  Title = '___ Friendly'
  ImagePath = 'achievements/badge_friendly.png'
  Description = 'Has at least ___ mutual follows.'
  Bubble = {
      right: 45,
      bottom: 104,
      orientation: :right
  };
  Levels = [10,20,50,100]

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (followers & following).count
  end

end
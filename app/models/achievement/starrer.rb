class Achievement::Starrer < LeveledAchievement
  Title = 'Starrer'
  ImagePath = 'achievements/badge_starrer.png'
  Description = 'Has starred at least ___ repos.'
  Bubble = {
      right: 43,
      bottom: 119,
      orientation: :right
  };
  Levels = [10, 25, 50, 100]

  def self.check(user)
    user.github.repos.starring.starred.count
  end

end
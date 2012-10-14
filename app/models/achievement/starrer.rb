class Achievement::Starrer < LeveledAchievement
  Title = 'Starrer'
  ImagePath = 'achievements/badge_starrer.png'
  Description = 'User starred at least ___ repos.'
  Bubble = {
      left: 58,
      bottom: 134,
      orientation: :left
  };
  Levels = [10, 25, 50, 100]

  def self.check(user)
    user.github.repos.starring.starred.count
  end

end
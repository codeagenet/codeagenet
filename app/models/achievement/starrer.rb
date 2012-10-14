class Achievement::Starrer < LeveledAchievement
  Title = '___ Starrer'
  ImagePath = 'achievements/badge_starrer.png'
  Description = 'Has starred at least ___ repos.'
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
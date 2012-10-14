class Achievement::Polyglot < LeveledAchievement
  Title = 'Polyglot'
  ImagePath = 'achievements/badge_poly.png'
  Description = 'User uses more than 3 languages.'
  Bubble = {
      right: 88,
      bottom: 105,
      orientation: :right
  };
  Levels = [3,5,7,10]

  def self.check(user)
    user.github.repos.all(type: 'owner').map { |repo| repo.language }.compact.uniq.count
  end

end
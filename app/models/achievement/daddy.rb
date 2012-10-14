class Achievement::Daddy < LeveledAchievement
  Title = '___ Daddy'
  ImagePath = 'achievements/badge_daddy.png'
  Description = 'Owns at least ___ repos.'
  Bubble = {
      right: 46,
      bottom: 92,
      orientation: :right
  };
  Levels = [20,50,100,200]

  def self.check(user)
    user.github.repos.all(type: 'owner').count
  end
end
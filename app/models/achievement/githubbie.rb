class Achievement::Githubbie < Achievement
  Title = 'Githubbie'
  ImagePath = 'achievements/badge_hubbie.png'
  Description = 'User owns at least 1 repo.'
  Bubble = {
      left: 45,
      bottom: 77,
      orientation: :left
  };


  def self.check(user)
    user.github.repos.all.count >= 1
  end

end
class Achievement::Githubbie < Achievement
  Title = 'Githubbie'
  ImagePath = 'achievements/githubbie.png'
  Description = 'User owns at least 1 repo.'

  def self.check(user)
    user.github.repos.all.count >= 1
  end

end
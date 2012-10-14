class Achievement::Forker < Achievement
  Title = 'Forker'
  ImagePath = 'achievements/badge_forker.png'
  Description = 'User owns at least 10 forks.'

  def self.check(user)
    user.github.repos.all(type: 'owner').select { |repo| repo.fork == true }.count >= 10
  end

end
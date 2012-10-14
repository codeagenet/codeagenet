class Achievement::ForeverAlone < Achievement
  Title = 'Forever Alone'
  ImagePath = 'achievements/badge_foreveralone.png'
  Description = 'User owns at least 10 repos(forks are not included) with 1 watcher or without watchers at all.'

  def self.check(user)
    user.github.repos.all(type: 'owner').select { |repo| repo.fork == false && repo.watchers < 2 }.count >= 10
  end
end

class Achievement::ForeverAlone < Achievement
  Title = 'Forever Alone'
  ImagePath = 'achievements/forever_alone.jpg'
  Description = 'User owns at least 10 repos(forks are not included) without watchers or with 1 watcher.'

  def self.check(user)
    user.github.repos.all(type: 'owner').select { |repo| repo.fork == false && repo.watchers < 2 }.count > 10
  end
end

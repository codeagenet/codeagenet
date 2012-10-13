class Achievement::ForeverAlone < Achievement
  def self.check(user)
    user.github.repos.all(type: 'owner').select { |repo| repo.fork == false && repo.watchers < 2 }.count > 10
  end
end

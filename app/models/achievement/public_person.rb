class Achievement::PublicPerson < Achievement
  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (followers - following).count > 10
  end
end

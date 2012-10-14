class Achievement::Friendly < Achievement
  Title = 'Friendly'
  ImagePath = 'achievements/badge_friendly.png'
  Description = 'User has at least 10 mutual follows.'
  Bubble = {
      right: 45,
      bottom: 104,
      orientation: :right
  };

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (followers & following).count >= 10
  end

end
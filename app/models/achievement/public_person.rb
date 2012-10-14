class Achievement::PublicPerson < Achievement
  Title = 'Public Person'
  ImagePath = 'achievements/badge_public.png'
  Description = 'User has at least 10 unmutual followers.'
  Bubble = {
      right: 108,
      bottom: 101,
      orientation: :right
  };

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (followers - following).count >= 10
  end
end

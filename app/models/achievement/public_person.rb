class Achievement::PublicPerson < LeveledAchievement
  Title = '___ Public Person'
  ImagePath = 'achievements/badge_public.png'
  Description = 'Has at least ___ unmutual followers.'
  Bubble = {
      right: 108,
      bottom: 101,
      orientation: :right
  };
  Levels = [10,50,200,1000]

  def self.check(user)
    followers = user.github.users.followers.all.map { |f| f.login }
    following = user.github.users.followers.following.map { |f| f.login }
    (followers - following).count
  end
end

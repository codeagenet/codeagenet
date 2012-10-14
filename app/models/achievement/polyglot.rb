class Achievement::Polyglot < Achievement
  Title = 'Polyglot'
  ImagePath = 'achievements/badge_poly.png'
  Description = 'User uses more than 3 languages.'
  Bubble = {
      right: 88,
      bottom: 105,
      orientation: :right
  };

  def self.check(user)
    user.github.repos.all(type: 'owner').map { |repo| repo.language }.compact.uniq.count > 3
  end

end
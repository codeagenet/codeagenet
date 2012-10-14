class Achievement::Rubyist < Achievement
  Title = 'Rubist'
  ImagePath = 'achievements/badge_rubist.png'
  Description = 'User uses ruby in at least 3 projects.'
  Bubble = {
      right: 88,
      bottom: 105,
      orientation: :right
  };

  def self.check(user)
    user.github.repos.all(type: 'owner').
        select { |repo| repo.fork == false }.
        map { |repo| repo.language }.
        compact.
        map { |lang| lang.downcase }.
        count("ruby") >= 3
  end

end
class Achievement::Railsrumbler < Achievement
  Title = 'Railsrumbler'
  ImagePath = 'achievements/badge_rumbler.png'
  Description = 'Participates on Rails Rumble.'
  Bubble = {
      right: 88,
      bottom: 105,
      orientation: :right
  };

  def self.check(user)
    user.github.orgs.all.map { |org| org.login }.include? "railsrumble"
  end
end
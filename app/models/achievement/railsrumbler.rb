class Achievement::Railsrumbler < Achievement
  Title = 'Railsrumbler'
  ImagePath = 'achievements/badge_rumbler.png'
  Description = 'Participates on Rails Rumble.'
  Bubble = {
      left: 71,
      bottom: 141,
      orientation: :left
  };

  def self.check(user)
    user.github.orgs.all.map { |org| org.login }.include? "railsrumble"
  end
end
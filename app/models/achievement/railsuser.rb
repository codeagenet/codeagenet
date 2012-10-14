class Achievement::Railsuser < LeveledAchievement
  Title = '___ Rails developer'
  ImagePath = 'achievements/badge_railser.png'
  Description = 'Has at least ___ repositories with Ruby on Rails.'
  Bubble = {
      left: 21,
      bottom: 141,
      orientation: :left
  };
  Levels = [3, 5, 10, 20]

  def self.check(user)
    gemfiles = []
    user.github.repos.all(type: 'owner').select { |repo| repo.fork == false }.each do |repo|
      begin
        gemfiles << Base64::decode64(user.github.repos.contents.find(repo.owner.login, repo.name, 'Gemfile').content)
      rescue Github::Error::NotFound
      end
    end
    gemfiles.map! { |gemfile| Gemnasium::Parser.gemfile(gemfile).dependencies }
    gemfiles = gemfiles.flatten.map! { |gem| gem.name }
    gemfiles.count("rails")
  end
end
class Achievement::Railsuser < LeveledAchievement
  Title = 'Rails developer'
  ImagePath = 'achievements/badge_railser.png'
  Description = 'User developing with Ruby on Rails. Has at least ___ repositories with Ruby on Rails.'
  Bubble = {
      right: 88,
      bottom: 105,
      orientation: :right
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
    gemfiles.flatten!.map! { |gem| gem.name }
    gemfiles.count("rails")
  end
end
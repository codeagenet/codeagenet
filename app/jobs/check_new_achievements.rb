class CheckNewAchievements
  @queue = :cron

  def self.perform
    Users.all.each{|u| u.earn_achievements }
  end
end

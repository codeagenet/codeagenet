class CheckNewAchievements
  @queue = :cron

  def self.perform
    User.all.each{|u| u.earn_achievements }
  end
end

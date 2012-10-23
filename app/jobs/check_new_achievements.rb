class CheckNewAchievements
  @queue = :cron

  def self.perform
    User.where(User.arel_table[:achievements_fetched_at].not_eq(nil)).each{|u| u.earn_achievements }
  end
end

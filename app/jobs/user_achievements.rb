class UserAchievements
  @queue = :realtime

  def self.perform(id)
    User.find(id).earn_achievements
  end
end

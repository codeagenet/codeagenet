class AddAchievementsFetchedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :achievements_fetched_at, :datetime, :default => nil
  end
end

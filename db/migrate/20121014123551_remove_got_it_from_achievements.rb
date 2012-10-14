class RemoveGotItFromAchievements < ActiveRecord::Migration
  def up
    remove_column :achievements, :got_it
  end

  def down
    add_column :achievements, :got_it, :string
  end
end

class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :type
      t.integer :counter
      t.boolean :got_it
      t.integer :user_id

      t.timestamps
    end
  end
end

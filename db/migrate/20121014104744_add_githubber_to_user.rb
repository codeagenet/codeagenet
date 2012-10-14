class AddGithubberToUser < ActiveRecord::Migration
  def change
    add_column :users, :githubber_from, :datetime, :default => nil
  end
end

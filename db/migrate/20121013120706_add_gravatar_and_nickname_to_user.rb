class AddGravatarAndNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :gravatar, :string
    add_column :users, :nickname, :string
    add_column :users, :name, :string
  end
end

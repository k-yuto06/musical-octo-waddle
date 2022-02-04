class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :like_artist, :string
    add_column :users, :unlike_artist, :string
  end
end

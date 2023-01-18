class AddTimestampsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :created_at, :timestamp
  end
end

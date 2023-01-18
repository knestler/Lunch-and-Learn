class AddUpdatedTimestampsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :updated_at, :timestamp
  end
end

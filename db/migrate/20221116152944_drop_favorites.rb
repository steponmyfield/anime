class DropFavorites < ActiveRecord::Migration[7.0]
  def change
    drop_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index [:review_id], name: "index_favorites_on_review_id"
      t.index [:user_id], name: "index_favorites_on_user_id"
    end
  end
end

class AddsynopsisToanimations < ActiveRecord::Migration[7.0]
  def change
    add_column :animations, :synopsis, :string
  end
end

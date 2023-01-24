class CreateAnimations < ActiveRecord::Migration[7.0]
  def change
    create_table :animations do |t|
      t.string :animation_name
      t.string :animation_image

      t.timestamps
    end
  end
end

class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :swiper_id
      t.integer :swipee_id
      t.boolean :direction
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end

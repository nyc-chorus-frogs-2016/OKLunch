class CreateMatchRestaurants < ActiveRecord::Migration
  def change
    create_table :match_restaurants do |t|
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.boolean :match, default: false
      t.boolean :is_permanent, default: false
      t.timestamps null: false
    end
  end
end

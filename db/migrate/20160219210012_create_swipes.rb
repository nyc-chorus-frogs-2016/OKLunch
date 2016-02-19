class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :user_id
      t.integer :restaurant_id
    end
  end
end

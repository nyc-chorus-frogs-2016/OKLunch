class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :average_rating, null: false
      t.string :cuisine, null: false
      t.string :image_url, null: false
      t.string :phone, null: false

      t.timestamps null: false
    end
  end
end

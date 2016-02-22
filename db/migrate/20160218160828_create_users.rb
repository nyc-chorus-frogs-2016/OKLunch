class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :password_digest
      t.string :age
      t.string :image
      t.text :background_information
      t.text :interests
      t.boolean :is_desperate, default: false
      t.timestamps null: false
    end
  end
end

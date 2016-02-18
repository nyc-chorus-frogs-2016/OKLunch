class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :age, null: false
      t.string :interests, null: false
      t.string :photo, null: false
      t.string :background_information, null: false
      t.timestamps null: false
    end
  end
end

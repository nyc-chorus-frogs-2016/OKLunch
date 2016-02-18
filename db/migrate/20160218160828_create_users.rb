class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    #These are OmniAuth related
      t.string :name, null: false
      t.string :provider
      t.string :uid

      t.string :password_digest, null: false
      t.string :age, null: false
      t.string :interests, null: false
      t.string :photo, null: false
      t.string :background_information, null: false
      t.timestamps null: false
    end
  end
end

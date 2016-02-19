class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    #These are OmniAuth related
      t.string :name
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at


      t.string :password_digest
      t.string :age
      t.attachment :image
      t.string :background_information
      t.boolean :is_desperate, default: false
      t.timestamps null: false
    end
  end
end

class CreateMatchUsers < ActiveRecord::Migration
  def change
    create_table :match_users do |t|
      t.integer :creator_id, null: false
      t.integer :target_id, null: false
      t.string :status, null: false
      t.boolean :accepted, default: false
      t.timestamps null: false
    end
  end
end

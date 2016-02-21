class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id, null: false
      t.integer :match_user_id, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.string :content, null: false
      t.timestamps null: false
    end
  end
end

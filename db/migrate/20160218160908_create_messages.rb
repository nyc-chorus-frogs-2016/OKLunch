class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id, null: false
      t.integer :user_id, null: false
      t.string :content, null: false
      t.timestamps null: false
    end
  end
end

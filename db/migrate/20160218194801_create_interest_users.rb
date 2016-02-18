class CreateInterestUsers < ActiveRecord::Migration
  def change
    create_table :interest_users do |t|
      t.integer :user_id, null: false
      t.integer :interest_id, null: false
      t.timestamps null: false
    end
  end
end

class CreateWaitlistUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :waitlist_users do |t|
      t.string :email_address, null: false, limit: 319, unique: true
      t.integer :business_type, null: false
      t.string :notes, limit: 1024

      t.timestamps
    end
  end
end

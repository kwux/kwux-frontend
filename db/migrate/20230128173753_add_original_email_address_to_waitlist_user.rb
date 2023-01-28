class AddOriginalEmailAddressToWaitlistUser < ActiveRecord::Migration[7.0]
  def change
    add_column :waitlist_users, :original_email_address, :string, limit: 319, unique: true
  end
end

json.extract! waitlist_user, :id, :email_address, :business_type, :notes, :created_at, :updated_at
json.url waitlist_user_url(waitlist_user, format: :json)

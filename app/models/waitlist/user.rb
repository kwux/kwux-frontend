# == Schema Information
#
# Table name: waitlist_users
#
#  id            :bigint           not null, primary key
#  business_type :integer          not null
#  email_address :string(319)      not null
#  notes         :string(1024)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Waitlist::User < ApplicationRecord
  enum business_type: {
    "Personal Use" => 0,
    "Start-up" => 1,
    "Agency/Consultancy" => 2,
    "Enterprise" => 3
  }

  validates :email_address, presence: true
  validates :business_type, presence: true
  validates :email_address, length: { in: 4..319 }, uniqueness: true, unless: ->(user) { user.email_address.blank? }
  validates :notes, length: { maximum: 1024 }
  validates :business_type, inclusion: business_types.keys, unless: ->(user) { user.business_type.blank? }
end

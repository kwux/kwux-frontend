# == Schema Information
#
# Table name: waitlist_users
#
#  id                     :bigint           not null, primary key
#  business_type          :integer          not null
#  email_address          :string(319)      not null
#  notes                  :string(1024)
#  original_email_address :string(319)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe Waitlist::User, type: :model do
  describe "attributes" do
    # Required for validations; otherwise, rspec will fill-in the gaps
    subject!{ build(:waitlist_user) }

    context "email_address" do
      describe "validations" do
        it "is a required field" do
          expect(subject).to validate_presence_of(:email_address)
        end

        # https://sendgrid.com/blog/email-marketing-length-best-practices/
        it "should be between 4 and 319 desired characters long" do
          expect(subject).to validate_length_of(:email_address)
                               .is_at_least(4)
                               .is_at_most(319)
        end

        context "uniqueness" do

          it "is unique" do
            expect(subject).to validate_uniqueness_of(:email_address).case_insensitive
          end

          it "and duplicate items aren't allowed" do
            waitlist_user_1 = build(:waitlist_user)
            waitlist_user_2 = waitlist_user_1.deep_dup

            expect(waitlist_user_1.save).to eq true
            expect(waitlist_user_2.save).to eq false
          end
        end
      end

      it "should be encrypted" do
        expect { subject.save }.to change { subject.encrypted_attribute?(:email_address) }
                                     .from(false)
                                     .to(true)
      end
    end

    context "notes" do
      it "is max 1024 chars" do
        expect(subject).to validate_length_of(:notes)
                             .is_at_most(1024)
      end
    end

    context "business_type" do
      it do
        should define_enum_for(:business_type).
          with_values(subject.class.business_types.keys)
      end
    end
  end
end

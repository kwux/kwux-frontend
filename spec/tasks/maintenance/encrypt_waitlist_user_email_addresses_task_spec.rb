# frozen_string_literal: true

require "rails_helper"

module Maintenance
  RSpec.describe EncryptWaitlistUserEmailAddressesTask do
    let(:element) do
      # Object to be processed in a single iteration of this task
      ActiveRecord::Encryption.without_encryption do
        create(:waitlist_user)
      end
    end

    it "should not have encrypted email address" do
      expect(element.encrypted_attribute?(:email_address)).to eq(false)
    end

    describe "#process" do

      it "should have an encrypted email address" do
        expect { described_class.process(element) }.to change { element.encrypted_attribute?(:email_address) }
                                                         .from(false)
                                                         .to(true)
      end
    end
  end
end

require "rails_helper"

RSpec.describe "Waitlist", :type => :feature do
  # Let's use the dom_id helper
  include ActionView::RecordIdentifier

  let!(:waitlist_user) { build(:waitlist_user) }

  context "User visits the home page for the first time" do
    before(:each) do
      visit '/'
    end

    it "should have the waitlist signup form rendered" do
      expect(page).to have_selector(:id, dom_id(waitlist_user))
    end

    scenario "User completes the form" do
      within :id, dom_id(waitlist_user) do
        page.fill_in I18n.t('waitlist.users.form.email_address'), with: waitlist_user.email_address
        page.select waitlist_user.business_type, from: I18n.t('waitlist.users.form.business_type')
      end

      click_button I18n.t('waitlist.users.form.submit')
      within :id, dom_id(waitlist_user) do
        expect(page).to have_selector('h2', text: I18n.t('pages.waitlist_signup.success.header'))
        expect(page).to have_selector('h3', text: I18n.t('pages.waitlist_signup.success.subheader'))
        expect(page).to have_selector('div>p')
      end
    end
  end
end

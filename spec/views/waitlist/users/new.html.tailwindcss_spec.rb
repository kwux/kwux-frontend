require 'rails_helper'

RSpec.describe "waitlist/users/new", type: :view do
  before(:each) do
    assign(:waitlist_user, Waitlist::User.new(
      email_address: "MyText",
      business_type: 1,
      notes: "MyText"
    ))
  end

  it "renders new waitlist_user form" do
    render

    assert_select "form[action=?][method=?]", waitlist_users_path, "post" do

      assert_select "input[name=?]", "waitlist_user[email_address]"

      assert_select "select[name=?]", "waitlist_user[business_type]"
    end
  end
end

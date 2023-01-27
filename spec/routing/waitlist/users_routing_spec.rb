require "rails_helper"

RSpec.describe Waitlist::UsersController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/waitlist/users/new").to route_to("waitlist/users#new")
    end

    it "routes to #create" do
      expect(post: "/waitlist/users").to route_to("waitlist/users#create")
    end
  end
end

require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Item, type: :model do
  let(:my_user) {User.create!(name: "Bill Smith", email: "bill@example.com", password: "password", confirmed_at: Time.now)}
  let(:my_item) {Item.create!(name: " This is some cool text to add to my to-do list", user_id: my_user.id)}
  #let(:wiki) {Wiki.create!(title: "My first wiki", body: " This is some cool text to add to my wiki", user_id: 1, private: false)}

  describe "attributes" do

      it "should respond to title" do
        expect(my_item).to respond_to(:name)
      end

      it "should repsond to user" do
        expect(my_item).to respond_to(:user_id)
      end

  end


end

require 'rails_helper'
include RandomData
include Devise::TestHelpers


RSpec.describe ItemsController, type: :controller do
  let(:my_user) {User.create!(name: "Bill Smith", email: "bill@example.com", password: "password", confirmed_at: Time.now)}
  let(:my_item) {Item.create!(name: "This is some cool text to add to my to-do list", user_id: my_user.id)}

  context "standard user" do

  #Sign in the new user and confirm there email response
  before do
    sign_in my_user
    # my_user.confirm ==> not needed since I update the confirmed_at field
  end

  describe "GET show" do

    it "returns http success" do
      get :index, user_id: my_item.user_id
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index, user_id: my_item.user_id
      expect(response).to render_template :index
    end

    it "assigns my_item to @item" do
      get :index, user_id: my_item.user_id, id: my_item.id
      expect(assigns(:items)).to eq([my_item])
    end
  end

  describe "GET new" do
    it "returns http redirect" do
      get :new, user_id: my_item.user_id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, user_id: my_item.user_id
      expect(response).to render_template :new
    end

    it "instantiates @item" do
      get :new, user_id: my_item.user_id
      expect(assigns(:item)).not_to be_nil
    end
  end


  describe "POST create" do
    it "increases the number of Items by 1" do
      #expect{ post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph} }.to change(Wiki,:count).by(1)
      expect{ post :create, format: :js, user_id: my_user.id, item: {name: RandomData.random_sentence, user_id: my_user.id} }.to change(Item,:count).by(1)
    end

    it "assigns the new wiki to @item" do
      #post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      post :create, format: :js, user_id: my_user.id, item: {name: RandomData.random_sentence, user_id: my_user.id}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the new item" do
    #  post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      post :create, format: :js, user_id: my_user.id, item: {name: RandomData.random_sentence, user_id: my_user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do

    it "returns http redirect"  do
      delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      expect(response).to have_http_status(:success)
    end
  end

=begin
  describe "GET edit" do
    it "returns http redirect" do
      get :edit, id: my_wiki.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "returns http redirect" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}
      expect(response).to redirect_to my_wiki
    end
  end


=end

 end


#### end rspec
end

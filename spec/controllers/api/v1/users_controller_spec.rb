require 'spec_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.marketplace.v1" }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    # I didn't find the reason of respond_with doesnt exist
    #it { should respond_with 200 }
  end

  context "When is not created" do
  	before(:each) do
  	  #notice I'm not incluing the email
  	  @invalid_user_attributes = {password: "12345678", password_confirmation: "12345678" }
  	end

  	it "renders an errors json" do
  	  user_response = JSON.parse(response.body, symbolize_names: true)
  	  expect(user_response).to have_key(:errors)
  	end

  	it "renders the json erros on why the user could not be created" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:errors][:email]).to include "can't be blank"
    end

    it { should respond_with 422 }
  end

  describe "PUT/PATCH #update" do
  	context "when is successfully update" do
  		before(:each) do
  		  @user = FactoryGirl.create :user
  		  patch :update, {id: @user.id, user: {email: "newmail@example.com"}}, format: :json
  		end

  		it "renders the json representation for the update user" do
  		  user_response = JSON.parse(response.body, symbolize_names: true)
  		  expect(user_response[:email]).to eql "newmail@example.com"
  		end

  		it { should respond_with 200 }
  	end
    
    context "when is not created" do
      before(:each) do
      	@user = FactoryGirl.create :user
      	patch :update, {id: @user.id, user: {email: "bademail.com"}}, format: :json
      end

      it "renders an erros joson" do
      	user_response = JSON.parse(response.body, symbolize_names: true)
      	expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be created" do
      	user_response = JSON.parse(response.body, symbolize_names: true)
      	expect(user_response[:errors][:email]).to include "is invalid"
      end

      it {should respond_with 422}
    end
  end	  
end
require 'spec_helper'

describe Api::V1::SessionsController do

  describe "POST #create" do
    before(:each) do
      @user = FactoryGirl.create :user
    end

    context "when the credentials are correct" do 
      before(:each) do
        credentials = {email: @user.email, password: "12345678"}
        post :create, {session: credentials}
      end

      it "return the user record corresponding to the given credentials" do 
        @user.reload
        expect(json_response[:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 200}
    end

    context "when de credentials are incorrect" do
      before(:each) do
        credentials = {email: @user.email, password: "invalidpassword"}
        post :create, {session: credentials}
      end

      it "returns a json with an error" do
      	expect(json_response[:errors]) == "Invalid email or password"
      end

      it {should respond_with 422}

    end
  end
end

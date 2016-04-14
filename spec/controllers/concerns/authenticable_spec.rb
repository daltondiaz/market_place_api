require 'spec_helper'

#   If you are wondering, why in the hell we created a 
# Authentication class inside the spec file. 
# The answer is simple, when it comes to test 
# modules I find it easy to include them into a 
# temporary class and stub any other methods I may 
# require later, like the request shown above.
class Authentication
  include Authenticable
end

describe Authenticable do
  let(:authentication) {Authentication.new}
  subject {authentication}

  describe "#current_user" do
  	before do
  	  @user = FactoryGirl.create :user
  	  request.headers["Authorization"] = @user.auth_token
  	  authentication.stub(:request).and_return(request) 
  	end

  	it "returns the user from the authorization header" do
      expect(authentication.current_user.auth_token).to eql @user.auth_token
  	end
  end

end
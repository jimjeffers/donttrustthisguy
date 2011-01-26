require 'spec_helper'

describe AuthenticationController do

  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'logout'" do
    it "should be successful" do
      get 'logout'
      response.should redirect_to(login_path)
    end
  end

end

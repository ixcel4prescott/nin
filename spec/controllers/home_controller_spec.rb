require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
      @user.add_role :anything
      get 'index'
      response.should be_success
    end
  end

end

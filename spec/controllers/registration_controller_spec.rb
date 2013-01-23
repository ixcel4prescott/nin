require 'spec_helper'

describe Users::RegistrationsController do

  describe "Interpreter Registration" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in :user, FactoryGirl.create(:user)
    end

    it "should provide an interpreter sign-up page" do
      get 'interpreter_sign_up'
      response.should be_success
    end

    it "should facilitate an interpreter sign-up for post with valid values" do
      interpreter_attributes = {
        :interpreter =>
          FactoryGirl.attributes_for(:interpreter)
          .merge({:mailing_address_attributes => FactoryGirl.attributes_for(:address)})
          .merge({:work_address_attributes => FactoryGirl.attributes_for(:address)})
          .merge({:insurance_attributes => [ FactoryGirl.attributes_for(:insurance) ] })
          .merge({:payment_method_attributes => FactoryGirl.attributes_for(:payment_method)})
      }

      expect {
        post "interpreter_create", interpreter_attributes
      }.to change(Interpreter, :count).by(1)
    end

  end

end
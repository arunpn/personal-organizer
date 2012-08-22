require 'spec_helper'

describe AccountsController do

  describe "GET 'index'" do
    it "returns http success" do
      sign_in
      get 'index'
      response.should be_success
    end
  end

end

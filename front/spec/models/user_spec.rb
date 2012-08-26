require  'spec_helper'

describe User do
  it { should have_many(:accounts) }

  describe "#new_account" do
    subject { create(:user) }
    
    it "creates a new account for the user" do
      subject.new_account('wallet', -2000)
      subject.accounts.count.should == 1
    end

    it "returns the new account" do
      subject.new_account('wallet', -2000).should be_kind_of(Account)

    end
  end
end

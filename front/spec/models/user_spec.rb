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
  
  describe "#destroy" do
    subject { create(:user) }
    it "removes the user" do
      subject.destroy
      expect { User.find(subject.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it "removes all his accounts" do
      3.times { create(:account, user: subject) }
      subject.destroy
      Account.where(user_id: subject.id).should be_empty
    end
  end
end

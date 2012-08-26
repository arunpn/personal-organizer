require  'spec_helper'

describe Account do
  it { should belong_to(:user) }
  it { should have_many(:transactions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:initial_balance) }
  it { should validate_numericality_of(:initial_balance) }
  
  describe "#current_balance", :wip do
    context "for an account without transactions" do
      subject { build(:account, initial_balance: 3000) }
      it "returns the initial balance" do
        subject.current_balance.should == 3000
      end
    end
    context "for an account with transactions" do
      subject { create(:account, initial_balance: 3000) }
      
      it "returns the total with the initial balance and transaction's amounts" do
        create(:transaction, amount: -500, account: subject)
        create(:transaction, amount: 1500, account: subject)
        create(:transaction, amount: -300, account: subject)
        subject.current_balance.should == 3700
      end
    end
  end
end

require  'spec_helper'

describe Account do
  it { should belong_to(:user) }
  it { should have_many(:transactions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:initial_balance) }
  it { should validate_numericality_of(:initial_balance) }
  
  describe "#current_balance" do
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
  
  describe "#bulk_create" do
    context "given a transactions parameters hash and a date" do
      subject { create(:account) }
      let(:transaction0) { attributes_for(:transaction_param, name: '') }
      let(:transaction1) { attributes_for(:transaction, account: subject) }
      let(:transaction2) { attributes_for(:transaction_param, amount: '') }
      let(:transaction3) { {name: '', amount: '', description: ''} }
      let(:params) { { "0" => transaction0, "1" => transaction1, "2" => transaction2, "3" => transaction3 } }
      
      it "creates all valid transactions in there for the specified date" do
        subject.bulk_create(params, Date.today)
        Transaction.where(account_id: subject.id).count.should == 1
      end
      
      it "returns all invalid transactions in an array ignoring blank transaction param hashes" do
        subject.bulk_create(params, Date.today).length.should == 2
      end
    end
  end
  
  describe "#destroy" do
    subject { create(:account) }
    it "removes the account" do
      subject.destroy
      expect { Account.find(subject.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it "removes all its transactions" do
      3.times { create(:transaction, account: subject) }
      subject.destroy
      Transaction.where(account_id: subject.id).should be_empty
    end
  end
end
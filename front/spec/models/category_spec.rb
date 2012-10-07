require 'spec_helper'

describe Category do
  it { should belong_to(:user) }
  it { should have_many(:transactions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:user_id) }

  describe "#color=" do
    it "appends a # at the beginning if the parameter has not" do
      create(:category, color: "4a4a4a").color.should == "#4a4a4a"
    end
    
    context "validation" do
      it "is valid with 3 hexadecimal digits" do
        build(:category, color: "333").should be_valid
      end
      it "is valid with 6 hexadecimal digits" do
        build(:category, color: "#F0F0F0").should be_valid
      end
      it "is not valid otherwhise" do
        category = build(:category, color: "45tf")
        category.save
        category.errors.messages[:color].should include("has to be an 3 or 6 hexadecimal number")
      end
    end
  end
end

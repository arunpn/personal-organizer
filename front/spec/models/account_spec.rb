require  'spec_helper'

describe Account do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:initial_balance) }
  it { should validate_numericality_of(:initial_balance) }
end

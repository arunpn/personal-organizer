require 'spec_helper'

describe Transaction do
  it { should belong_to(:account) }
  it { should belong_to(:category) }
  it { should validate_presence_of(:account_id) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:creation) }
  it { should validate_numericality_of(:amount) }
end
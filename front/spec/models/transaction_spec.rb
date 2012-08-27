require 'spec_helper'

describe Transaction do
  it { should belong_to(:account) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_numericality_of(:amount) }
end
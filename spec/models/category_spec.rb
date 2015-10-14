require 'rails_helper'

describe Category do
  it { should have_many :movies}
  it { should validate_presence_of :name }
  it { should validate_length_of :name }
end

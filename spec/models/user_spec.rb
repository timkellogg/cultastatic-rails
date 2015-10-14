require 'rails_helper'

describe User do
  it { should have_many :reviews }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_length_of :length  }
end

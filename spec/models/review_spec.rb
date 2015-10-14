require 'rails_helper'

describe Review do
  it { should belong_to :movie }
  it { should belong_to :user }
end

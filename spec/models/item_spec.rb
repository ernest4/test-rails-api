require 'rails_helper'

RSpec.describe Item, type: :model do
  # Association test
  # ensure Item record belongs to a single Todo record
  it { should belong_to(:todo) }

  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end

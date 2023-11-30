require 'rails_helper'

RSpec.describe Musician, type: :model do
  it {should have_many :synthesizers}
end

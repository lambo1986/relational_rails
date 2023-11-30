require 'rails_helper'

RSpec.describe Synthesizer, type: :model do
  it {should belong_to :musician}
end

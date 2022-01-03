require 'rails_helper'

RSpec.describe TripTrail do
  describe 'relationships' do
    it { should belong_to :trip}
    it { should belong_to :trail}
  end
end

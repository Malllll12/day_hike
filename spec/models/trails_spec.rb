require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe 'relationships' do
    it { should have_many :trip_trails }
    it { should have_many(:trips).through(:trip_trails) }
  end

  describe 'methods' do
    it '.trip_count' do
      rocky = Trip.create!(name: "Rocky Mtn National Park")
      yellowstone = Trip.create!(name: "Yellowstone National Park")
      yosemite = Trip.create!(name: "Yosemite National Park")
      flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
      waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
      cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

      rocky.trails << flower
      rocky.trails << waterfall
      rocky.trails << cliff
      yellowstone.trails << flower
      yellowstone.trails << waterfall
      yosemite.trails << flower
      yosemite.trails << cliff

      expect(flower.trip_count).to eq(3)
    end
  end
end

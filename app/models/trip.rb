class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length)
  end

  def longest_trail
    trails.order(:length).last
  end

  def shortest_trail
    trails.order(:length).first
  end
end

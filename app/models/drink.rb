class Drink < ActiveRecord::Base

  validates :alcohol, presence: :true
  validates_uniqueness_of :alcohol, scope: [:mixer]

  validates :over_ice, presence: :true, inclusion: {in: [true, false]}
  validates :top_shelf, presence: :true, inclusion: {in: [true, false]}
  validates :price, presence: :true, numericality: { less_than_or_equal_to: 10 }

end

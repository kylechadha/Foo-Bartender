require 'spec_helper'

describe Drink do

  it 'is valid when an alcohol is present, it has a price, and the over_ice and top_shelf values are set' do
    # beer = Drink.create(alcohol: "beer", price: 5, over_ice: false, top_shelf: false)
    expect(FactoryGirl.build(:drink)).to be_valid
  end

  it 'is invalid without alcohol present' do
    # expect(FactoryGirl.build(:drink, alcohol: nil)).not_to be_valid
    # expect(FactoryGirl.build(:drink, alcohol: nil)).to be_invalid
    expect(FactoryGirl.build(:drink, alcohol: nil)).to have(1).errors_on(:alcohol)
  end

  it 'is also invalid without an over_ice value (true or false)' do
    expect(FactoryGirl.build(:drink, over_ice: "like a fox")).to have(1).errors_on(:over_ice)
  end

  it 'is also invalid without an top_shelf value (true or false)' do
    expect(FactoryGirl.build(:drink, top_shelf: "like a fox")).to have(1).errors_on(:top_shelf)
  end

  it 'is invalid without price present' do
    expect(FactoryGirl.build(:drink, price: nil)).to have(2).errors_on(:price)
  end

  it 'is invalid if the price is not a number' do
    expect(FactoryGirl.build(:drink, price: "high five")).to be_invalid
  end

  it 'is invalid if the drink name (alcohol + mixer) is identifical to that of another Drink' do
    drink = FactoryGirl.create(:drink)
    drink2 = FactoryGirl.build(:drink) 
    expect(drink2).to be_invalid
  end

  it "has a price lower than $10 (we're a dive bar)" do
    expect(FactoryGirl.build(:drink, price: 13)).to have(1).errors_on(:price)
  end

    

  # Test Number 9
  # Test Number 10
  # Test Number 11
  # Test Number 12
  # Test Number 13
  # Test Number 14
  # Test Number 15
  # Test Number 16

end

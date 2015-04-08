require 'spec_helper'

describe Lepreshawn do
  let(:draw) { Lepreshawn::Drawing.new.draw}

  it 'has a version number' do
    expect(Lepreshawn::VERSION).not_to be nil
  end

  it 'returns an array with 6 numbers' do
    expect(draw).to be_an Array
    expect(draw.count).to eq(6)
  end

  it 's numbers are smaller than 50' do
    draw.each do |number| 
      expect(number).to be < 50
    end
  end
  
  it 'each element is an Integer' do
    draw.each do |number| 
      expect(number).to be_an Integer
    end
  end
end

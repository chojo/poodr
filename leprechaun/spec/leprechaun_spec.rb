require 'spec_helper'

describe Leprechaun do
  it 'has a version number' do
    expect(Leprechaun::VERSION).not_to be nil
  end

  it 'generates a lottery drawing with 6 elements' do
    expect(Leprechaun::Drawing.new.draw.count).to eq(6)
  end

  it 'contains only numbers' do
    def is_number?
      Leprechaun::Drawing.new.draw.all? { |x| x.is_a? Integer  }
    end

    expect(is_number?).to eq(true)
  end

  xit 'does something useful' do
    expect(false).to eq(true)
  end
end

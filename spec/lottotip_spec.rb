require_relative '../lib/lottotip'

describe Lottotip do
  before :each do
    @tip = Lottotip.new.draw

    def is_number?
      @tip.all? { |x| x.is_a? Integer } 
    end

    def is_smaller_than_49?
      @tip.all? { |x| x.between?(0, 49) } 
    end
  end

  describe "#draw" do
    it "returns an array " do
      expect(@tip).to be_a_kind_of Array
    end

    it "has six elements" do
      expect(@tip.count).to eq(6)
    end

    it "contains only integers" do
      expect(is_number?).to eq(true)
    end
    
    it "numbers are smaller than 49" do
      expect(is_smaller_than_49?).to eq(true)
    end

  end
  
end

require_relative '../lib/gear'

describe Gear do
  before :each do
    @small_gear = Gear.new(30, 27)
    @big_gear = Gear.new(52, 11)
  end

  describe "#ratio" do
    it "returns the ratio of chainring and cog" do
      expect(@small_gear.ratio).to eq(30/27.to_f)
      expect(@big_gear.ratio).to eq(52/11.to_f)
    end
  end
  
end

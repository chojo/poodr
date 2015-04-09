require_relative '../lib/gear'
require_relative '../lib/wheel'

describe Gear do
  let(:wheel)           { Wheel.new(26, 2.1) }
  let(:gear)           { Gear.new(52, 11, wheel) }
  let(:gear_inches)    { wheel.diameter * gear.ratio }

  describe "#ratio" do
    it "returns the ratio of chainring and cog" do
      expect(gear.ratio).to eq(52/11.to_f)
    end
  end
  
  describe "#gear_inches" do
    it "returns the gear inches" do
      expect(gear.gear_inches).to eq(142.76363636363638)
    end
  end
end

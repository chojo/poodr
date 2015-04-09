require_relative '../lib/gear'

describe Gear do
  let(:gear)           { Gear.new(52, 11, 29, 2.1) }
  let(:wheel_diameter) { gear.rim + ( 2 * gear.tire ) }
  let(:gear_inches)    { wheel_diameter * gear.ratio }

  describe "#ratio" do
    it "returns the ratio of chainring and cog" do
      expect(gear.ratio).to eq(52/11.to_f)
    end
  end
  
  describe "#gear_inches" do
    it "returns the gear inches" do
      # expect(gear.gear_inches).to eq(gear.ratio * ((gear.tire * 2) + gear.rim))
      expect(gear.gear_inches).to eq(156.94545454545457)
    end
  end
end

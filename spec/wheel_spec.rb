require_relative '../lib/gear'
require_relative '../lib/wheel'

describe Gear do
  let(:wheel)           { Wheel.new(26, 2.1) }

  describe "#diameter" do
    it "returns the diameter" do
      expect(wheel.diameter).to eq(30.2)
    end
  end
  
  describe "#circumference" do
    it "returns the circumference" do
      expect(wheel.circumference.round).to eq(95)
    end
  end
end

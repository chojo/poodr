class Gear 
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

# Gear.new(52, 11, 26, 1.5).gear_inches
# When Gear hard-codes a reference to Wheel deep inside its gear_inches method,
# it is explicitly declaring that it is only willing to calculate gear inches
# for instances of Wheel.

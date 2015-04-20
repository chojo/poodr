class Gear 
  attr_reader :chainring, :cog, :wheel
  # remove argument-order dependencies and specifying defaults
  def initialize(args)
    @chainring = args.fetch.(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end

  # Gear.new(
  #   chainring: 52,
  #   cog: 11,
  #   wheel: Wheel.new(26, 1.5)).gear_inches

  def gear_inches
    # ... a few lines of scary math
    ratio * diameter
    # ... more lines of scary math
  end

  def diameter
    wheel.diameter
  end  

  def ratio
    chainring / cog.to_f
  end
end

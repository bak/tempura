class Tempura::Fahrenheit < Tempura::Temperature

  def from_native(given)
    ((given + BigDecimal("459.67")) * 5) / 9
  end

  def self.as_native(k)
    ((k * 9)/5) - BigDecimal("459.67")
  end

end

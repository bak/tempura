class Tempura::Celsius < Tempura::Temperature

  def from_native(given)
    given + BigDecimal("273.15")
  end

  def self.as_native(k)
    k - BigDecimal("273.15")
  end

end

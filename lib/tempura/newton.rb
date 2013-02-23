class Tempura::Newton < Tempura::Temperature

  def from_native(given)
    ((given * 100) / 33) + BigDecimal("273.15")
  end

  def self.as_native
    ((k - BigDecimal("273.15")) * 33) / 100
  end

end

# encoding: utf-8
class Tempura::Réaumur < Tempura::Temperature

  def from_native(given)
    ((given * 5) / 4) + BigDecimal("273.15")
  end

  def self.as_native(k)
    ((k - BigDecimal("273.15")) * 4) / 5
  end

end

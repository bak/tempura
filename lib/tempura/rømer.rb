# encoding: utf-8
class Tempura::Rømer < Tempura::Temperature

  def from_native(given)
    (((given - BigDecimal("7.5")) * 40) / 21) + BigDecimal("273.15")
  end

  def self.as_native(k)
    (((k - BigDecimal("273.15")) * 21) / 40) + BigDecimal("7.5")
  end

end

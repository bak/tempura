class Tempura::Delisle < Tempura::Temperature

  def from_native(given)
    BigDecimal("373.15") - ((given * 2) / 3)
  end

  def self.as_native(k)
    ((BigDecimal("373.15") - k) * 3) / 2
  end

end

class Tempura::Rankine < Tempura::Temperature

  def from_native(given)
    (given * 5) / 9
  end

  def self.as_native(k)
    (k * 9) / 5
  end

end

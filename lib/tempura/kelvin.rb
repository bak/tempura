class Tempura::Kelvin < Tempura::Temperature

  def from_native(given)
    given
  end

  def self.as_native(k)
    k
  end

end

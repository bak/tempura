# encoding: utf-8

class Numeric

  def degrees_celsius
    Tempura::Celsius.new(self)
  end

  def degrees_delisle
    Tempura::Delisle.new(self)
  end

  def degrees_fahrenheit
    Tempura::Fahrenheit.new(self)
  end

  def degrees_kelvin
    Tempura::Kelvin.new(self)
  end

  def degrees_newton
    Tempura::Newton.new(self)
  end

  def degrees_rankine
    Tempura::Rankine.new(self)
  end

  def degrees_réaumur
    Tempura::Réaumur.new(self)
  end
  alias :degrees_reaumur :degrees_réaumur

  def degrees_rømer
    Tempura::Rømer.new(self)
  end
  alias :degrees_romer :degrees_rømer
  
end

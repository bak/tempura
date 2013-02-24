# encoding: utf-8

class Tempura::Conversion
  
  def initialize(klass)
    @klass = klass
  end

  def celsius
    Tempura::Celsius.new(klass)
  end

  def delisle
    Tempura::Delisle.new(klass)
  end

  def fahrenheit
    Tempura::Fahrenheit.new(klass)
  end

  def kelvin
    Tempura::Kelvin.new(klass)
  end

  def newton
    Tempura::Newton.new(klass)
  end

  def rankine
    Tempura::Rankine.new(klass)
  end

  def réaumur
    Tempura::Réaumur.new(klass)
  end
  alias :reaumur :réaumur

  def rømer
    Tempura::Rømer.new(klass)
  end
  alias :romer :rømer

  private

  attr_reader :klass

end

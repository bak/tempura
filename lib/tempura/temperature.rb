# encoding: utf-8

require 'bigdecimal'

class Tempura::Temperature
  include Comparable

  def initialize(value)
    @common = to_common(value)
  end

  def <=>(temp)
    if temp.is_a?(Tempura::Temperature)
      @common <=> temp.send(:common)
    else
      @common <=> to_common(temp)
    end
  end

  def -(temp)
    if temp.is_a?(Tempura::Temperature)
      temp = to_native(temp)
    end
    self.class.new(in_native - temp)
  end

  def +(temp)
    if temp.is_a?(Tempura::Temperature)
      temp = to_native(temp)
    end
    self.class.new(in_native + temp)
  end

  def /(temp)
    if temp.is_a?(Tempura::Temperature)
      raise ArgumentError, "cannot divide by a Tempura::Temperature, only a Numeric"
    end
    self.class.new(in_native.div(temp))
  end

  def *(temp)
    if temp.is_a?(Tempura::Temperature)
      raise ArgumentError, "cannot multiply by a Tempura::Temperature, only a Numeric"
    end
    self.class.new(in_native * temp)
  end

  def to_f
    in_native.to_f
  end

  def to_i
    in_native.to_i
  end

  def to_d
    in_native
  end

  def to_native(temp)
    temp.send("in_#{self.class.name.split('::').last.downcase}")
  end

  def from_celsius(given)
    given + BigDecimal("273.15")
  end

  def in_celsius
    common - BigDecimal("273.15")
  end

  def to_celsius
    Tempura::Celsius.new(in_celsius)
  end

  def from_delisle(given)
    BigDecimal("373.15") - ((given * 2) / 3)
  end

  def in_delisle
    ((BigDecimal("373.15") - common) * 3) / 2
  end

  def to_delisle
    Tempura::Delisle.new(in_delisle)
  end

  def from_fahrenheit(given)
    ((given + BigDecimal("459.67")) * 5) / 9
  end

  def in_fahrenheit
    ((common * 9)/5) - BigDecimal("459.67")
  end

  def to_fahrenheit
    Tempura::Fahrenheit.new(in_fahrenheit)
  end

  def from_kelvin(given)
    given
  end

  def in_kelvin
    common
  end
  
  def to_kelvin
    Tempura::Kelvin.new(in_kelvin)
  end

  def from_newton(given)
    ((given * 100) / 33) + BigDecimal("273.15")
  end

  def in_newton
    ((common - BigDecimal("273.15")) * 33) / 100
  end

  def to_newton
    Tempura::Newton.new(in_newton)
  end

  def from_rankine(given)
    (given * 5) / 9
  end

  def in_rankine
    (common * 9) / 5
  end

  def to_rankine
    Tempura::Rankine.new(in_rankine)
  end

  def from_réaumur(given)
    ((given * 5) / 4) + BigDecimal("273.15")
  end

  def in_réaumur
    ((common - BigDecimal("273.15")) * 4) / 5
  end
  alias :in_reaumur :in_réaumur

  def to_réaumur
    Tempura::Réaumur.new(in_réaumur)
  end
  alias :to_reaumur :to_réaumur

  def from_rømer(given)
    (((given - BigDecimal("7.5")) * 40) / 21) + BigDecimal("273.15")
  end

  def in_rømer
    (((common - BigDecimal("273.15")) * 21) / 40) + BigDecimal("7.5")
  end
  alias :in_romer :in_rømer

  def to_rømer
    Tempura::Rømer.new(in_rømer)
  end
  alias :to_romer :to_rømer

  private
  
  attr_reader :common

  def to_common(given)
    self.send("from_#{self.class.name.split('::').last.downcase}", BigDecimal(given.to_s))
  end

  def in_native
    to_native(self)
  end
end

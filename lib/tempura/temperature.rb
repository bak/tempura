# encoding: utf-8

class Tempura::Temperature
  include Comparable

  def initialize(temp)
    if temp.is_a?(Tempura::Temperature)
      @common = temp.send(:common)
    else
      @common = to_common(temp)
    end
  end

  def <=>(temp)
    if temp.is_a?(Tempura::Temperature)
      @common <=> temp.send(:common)
    else
      @common <=> to_common(temp)
    end
  end

  def -(temp)
    self.class.new(in_native - numericalize(temp))
  end

  def +(temp)
    self.class.new(in_native + numericalize(temp))
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

  def to
    Tempura::Conversion.new(self)
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

  private
  
  attr_reader :common

  def to_common(given)
    self.from_native(BigDecimal(given.to_s))
  end

  Tempura::SCALES.each do |scale|
    define_method("in_#{scale.downcase}") do
      Tempura.const_get(scale.intern).as_native(common)
    end
  end

  def in_native
    to_native(self)
  end

  def to_native(temp)
    temp.send("in_#{self.class.name.split('::').last.downcase}")
  end

  def numericalize(temp)
    if temp.is_a?(Tempura::Temperature)
      to_native(temp)
    else
      temp
    end
  end
end

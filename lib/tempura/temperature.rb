# encoding: utf-8

# Parent class of all +Temperature+ objects in +Tempura+, inherited by +Tempura::Celsius+, etc.
class Tempura::Temperature
  include Comparable

  def initialize(temp)
    if temp.is_a?(Tempura::Temperature)
      @common = temp.send(:common)
    else
      @common = to_common(temp)
    end
  end

  # Compares against a +Temperature+ of any scale, or a numeric representation of the same scale as the receiver.
  #
  # @param temp [Tempura::Temperature, Numeric]
  def <=>(temp)
    if temp.is_a?(Tempura::Temperature)
      @common <=> temp.send(:common)
    else
      @common <=> to_common(temp)
    end
  end

  # Subtracts a +Temperature+ of any scale, or a numeric representation of the same scale as the receiver.
  #
  # @param temp [Tempura::Temperature, Numeric]
  def -(temp)
    self.class.new(in_native - numericalize(temp))
  end

  # Adds a +Temperature+ of any scale, or a numeric representation of the same scale as the receiver.
  #
  # @param temp [Tempura::Temperature, Numeric]
  def +(temp)
    self.class.new(in_native + numericalize(temp))
  end

  # Divides by +Numeric+.
  #
  # @param temp [Numeric]
  def /(temp)
    if temp.is_a?(Tempura::Temperature)
      raise ArgumentError, "cannot divide by a Tempura::Temperature, only a Numeric"
    end
    self.class.new(in_native.div(temp))
  end

  # Multiplies by +Numeric+.
  #
  # @param temp [Numeric]
  def *(temp)
    if temp.is_a?(Tempura::Temperature)
      raise ArgumentError, "cannot multiply by a Tempura::Temperature, only a Numeric"
    end
    self.class.new(in_native * temp)
  end

  # Returns {Tempura::Conversion} for the receiver, which recieves the name of the scale to convert to. E.g.,
  #
  #     c = Tempura::Celsius.new(100)
  #     c.to.fahrenheit #=> <Tempura::Fahrenheit ...
  # 
  def to
    Tempura::Conversion.new(self)
  end

  # Float representation of receiver
  def to_f
    in_native.to_f
  end

  # Integer representation of receiver
  def to_i
    in_native.to_i
  end

  # BigDecimal representation of receiver
  def to_d
    in_native
  end

  private
  
  attr_reader :common

  def to_common(given)
    self.from_native(BigDecimal(given.to_s))
  end

  def in_native
    to_native(self)
  end

  def to_native(temp)
    self.class.as_native(temp.send(:common))
  end

  def numericalize(temp)
    if temp.is_a?(Tempura::Temperature)
      to_native(temp)
    else
      temp
    end
  end
end

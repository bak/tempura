# encoding: utf-8

require 'spec_helper'

describe Tempura::Temperature do

  describe 'arithmetic' do
    it 'subtracts another temperature' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      celsius = Tempura::Celsius.new(0)
      result = fahrenheit - celsius
      expect(result).to eq(180)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

    it 'subtracts native degrees' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      result = fahrenheit - 32
      expect(result).to eq(180)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

    it 'adds another temperature' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      celsius = Tempura::Celsius.new(0)
      result = fahrenheit + celsius
      expect(result).to eq(244)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

    it 'adds native degrees' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      result = fahrenheit + 32
      expect(result).to eq(244)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

    it 'divides by a Numeric' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      result = fahrenheit / 2
      expect(result).to eq(106)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

    it 'multiplies by a Numeric' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      result = fahrenheit * 2
      expect(result).to eq(424)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

    it 'can average an array of temperatures' do
      f = Tempura::Fahrenheit.new(212)
      c = Tempura::Celsius.new(100)
      r = Tempura::Rømer.new(60)
      k = Tempura::Kelvin.new(373.15)
      result = ((f + c + r + k) / 4 ).to_delisle
      expect(result).to eq(0)
      expect(result).to be_a(Tempura::Delisle)
    end
  end

  describe 'comparison' do
    it 'compares internal value' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      celsius = Tempura::Celsius.new(101)
      leg = fahrenheit <=> celsius
      expect(leg).to eq(-1)
    end

    describe 'comparison operators' do
      it 'has >' do
        fahrenheit = Tempura::Fahrenheit.new(212)
        celsius = Tempura::Celsius.new(99)
        expect(fahrenheit > celsius).to be_true
      end

      it 'has <' do
        fahrenheit = Tempura::Fahrenheit.new(212)
        celsius = Tempura::Celsius.new(101)
        expect(fahrenheit < celsius).to be_true
      end

      it 'has <=' do
        fahrenheit = Tempura::Fahrenheit.new(212)
        celsius = Tempura::Celsius.new(101)
        expect(fahrenheit <= celsius).to be_true
      end

      it 'has >=' do
        fahrenheit = Tempura::Fahrenheit.new(212)
        celsius = Tempura::Celsius.new(99)
        expect(fahrenheit >= celsius).to be_true
      end

      it 'has ==' do
        c = Tempura::Celsius.new(100)
        d = Tempura::Delisle.new(0)
        f = Tempura::Fahrenheit.new(212)
        n = Tempura::Newton.new(33)
        ra = Tempura::Rankine.new(671.67)
        ré = Tempura::Réaumur.new(80)
        rø = Tempura::Rømer.new(60)

        scales = [c, d, f, n, ra, ré, rø]
        scales.each { |s1|
          scales.each { |s2|
            expect(s1 == s2).to be_true
          }
        }
      end
    end
  end

  describe 'casting to Numerics' do

    it 'casts to_f' do
      temp = Tempura::Fahrenheit.new(212)
      expect(temp.to_f).to eq(212.0)
      expect(temp.to_f).to be_a(Float)
    end

    it 'casts to_i' do
      temp = Tempura::Kelvin.new(373.15)
      expect(temp.to_i).to eq(373)
      expect(temp.to_i).to be_a(Integer)
    end

    it 'casts to_d' do
      temp = Tempura::Celsius.new(100)
      expect(temp.to_d).to eq(100.0)
      expect(temp.to_d).to be_a(BigDecimal)
    end

  end

end

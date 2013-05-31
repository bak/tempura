# Tempura
[![Build Status](https://secure.travis-ci.org/bak/tempura.png?branch=master)][travis]

[travis]: http://travis-ci.org/bak/tempura

Tempura is a library for temperature arithmetic, comparison, and conversion. Currently supported scales are Fahrenheit, Celsius, Kelvin, Delisle, Newton, Rankine, Réaumer, and Rømer.

Temperature objects may be instantiated directly, e.g. `Tempura::Celsius.new(100)`, or by using the methods defined on `Numeric`, e.g., `212.degrees_fahrenheit`

## Usage

### Instantiation

Direct instantiation:

		Tempura::Fahrenheit.new(212)

Via Numeric:

		100.degrees_celsius

### Conversion

`Tempura::Temperature` (each scales parent object) implements `#to`, which returns a `Tempura::Conversion`, which then may receive the name of a scale to convert to:

		212.degrees_fahrenheit.to.celsius #=> <Tempura::Celsius...

### Arithmetic

Subtract other temperatures of any scale, or native degrees:

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

Add temperatures of any scale, or native degrees:

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

Divide a temperature by a numeric:

    it 'divides by a Numeric' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      result = fahrenheit / 2
      expect(result).to eq(106)
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

Multiply a temperature by a numeric:

    it 'multiplies by a Numeric' do
      fahrenheit = Tempura::Fahrenheit.new(212)
      result = fahrenheit * 2
      expect(result).to eq(424)
      expect(result).to be_a(Tempura::Fahrenheit)
    end

### Comparison

`>`, `<`, `<=`, `>=`, `<=>`, and `==` are supported. Temperatures of the same or different scales may be compared, or a temperature may be compared with native degrees.

    Tempura::Fahrenheit.new(212) > Tempura::Celsius.new(99)
    Tempura::Fahrenheit.new(212) < Tempura::Celsius.new(101)
    Tempura::Fahrenheit.new(212) >= Tempura::Celsius.new(99)
    Tempura::Fahrenheit.new(212) <= Tempura::Celsius.new(101)

    scales = [
		  Tempura::Celsius.new(100),
		  Tempura::Delisle.new(0),
		  Tempura::Fahrenheit.new(212),
		  Tempura::Newton.new(33),
		  Tempura::Rankine.new(671.67),
		  Tempura::Réaumur.new(80),
		  Tempura::Rømer.new(60),
		]

		scales.all? { |s1|
			scales.each { |s2|
		    s1 == s2
			}
		}

    #=> true

### Casting

    Tempura::Fahrenheit.new(212).to_f
    Tempura::Kelvin.new(373.15).to_i
    Tempura::Celsius.new(100).to_d

## Installation

Add this line to your application's Gemfile:

    gem 'tempura'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tempura

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

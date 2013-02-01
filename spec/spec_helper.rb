# encoding: utf-8

require 'tempura'

shared_examples_for '373.15 K' do
  it 'is expressable in Celsius (C)' do
    expect(subject.to_celsius).to eq(100)
    expect(subject.to_celsius).to be_a(Tempura::Celsius)
  end

  it 'is expressable in Delisle (De)' do
    expect(subject.to_delisle).to eq(0)
    expect(subject.to_delisle).to be_a(Tempura::Delisle)
  end

  it 'is expressable in Fahrenheit (F)' do
    expect(subject.to_fahrenheit).to eq(212)
    expect(subject.to_fahrenheit).to be_a(Tempura::Fahrenheit)
  end

  it 'is expressable in Kelvin (K)' do
    expect(subject.to_kelvin).to eq(373.15)
    expect(subject.to_kelvin).to be_a(Tempura::Kelvin)
  end
  
  it 'is expressable in Newton (N)' do
    expect(subject.to_newton).to eq(33)
    expect(subject.to_newton).to be_a(Tempura::Newton)
  end

  it 'is expressable in Rankine (R)' do
    expect(subject.to_rankine).to eq(671.67)
    expect(subject.to_rankine).to be_a(Tempura::Rankine)
  end
  
  it 'is expressable in Réaumur (Ré)' do
    expect(subject.to_réaumur).to eq(80)
    expect(subject.to_réaumur).to be_a(Tempura::Réaumur)
    expect(subject.to_reaumur).to eq(80)
    expect(subject.to_reaumur).to be_a(Tempura::Réaumur)
  end
  
  it 'is expressable in Rømer (Rø)' do
    expect(subject.to_rømer).to eq(60)
    expect(subject.to_rømer).to be_a(Tempura::Rømer)
    expect(subject.to_romer).to eq(60)
    expect(subject.to_rømer).to be_a(Tempura::Rømer)
  end
end

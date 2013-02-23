# encoding: utf-8

require 'spec_helper'

describe Tempura::Conversion do
  let(:c) { 100.degrees_celsius }
  let(:d) { 0.degrees_delisle }
  let(:f) { 212.degrees_fahrenheit }
  let(:n) { 33.degrees_newton }
  let(:ra) { 671.67.degrees_rankine }
  let(:ré) { 80.degrees_réaumur }
  let(:rø) { 60.degrees_rømer }

  it 'provides a common interface' do
    [c, d, f, n, ra, ré, rø].each do |t|
      expect(t.to).to be_a(Tempura::Conversion)
    end
  end

  describe 'converting to temps' do

    it 'converts to a scale' do
      c2f = c.to.fahrenheit
      expect(c2f).to be_a(Tempura::Fahrenheit)
      expect(c2f).to eq(f)
    end

    it 'converts to an aliased scale' do
      n2ro = n.to.romer
      expect(n2ro).to be_a(Tempura::Rømer)
      expect(n2ro).to eq(rø)
    end

  end
end

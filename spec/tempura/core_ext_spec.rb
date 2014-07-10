# encoding: utf-8

require 'spec_helper'

describe Numeric do

  describe 'converting to temps' do
    let(:c) { 100.degrees_celsius }
    let(:d) { 0.degrees_delisle }
    let(:f) { 212.degrees_fahrenheit }
    let(:n) { 33.degrees_newton }
    let(:ra) { 671.67.degrees_rankine }
    let(:ré) { 80.degrees_réaumur }
    let(:re) { 80.degrees_reaumur }
    let(:rø) { 60.degrees_rømer }
    let(:ro) { 60.degrees_romer }

    it 'converts to celsius' do
      expect(c).to be_a(Tempura::Celsius)
    end

    it 'converts to delisle' do
      expect(d).to be_a(Tempura::Delisle)
    end

    it 'converts to fahrenheit' do
      expect(f).to be_a(Tempura::Fahrenheit)
    end

    it 'converts to newton' do
      expect(n).to be_a(Tempura::Newton)
    end

    it 'converts to rankine' do
      expect(ra).to be_a(Tempura::Rankine)
    end

    it 'converts to réaumur' do
      expect(ré).to be_a(Tempura::Réaumur)
      expect(re).to be_a(Tempura::Réaumur)
    end

    it 'converts to rømer' do
      expect(rø).to be_a(Tempura::Rømer)
      expect(ro).to be_a(Tempura::Rømer)
    end

    it 'correctly converted them all' do
      scales = [c, d, f, n, ra, ré, re, rø, ro]
      scales.each { |s1|
        scales.each { |s2|
          expect(s1 == s2).to be_truthy
        }
      }
    end
  end

end

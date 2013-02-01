# encoding: utf-8

require 'spec_helper'

describe Tempura::Rømer do
  subject { Tempura::Rømer.new(60) }

  it 'is natively in Rømer (Rø)' do
    expect(subject).to eq(60)
    expect(subject).to be_a(Tempura::Rømer)
  end

  it_behaves_like '373.15 K'
end

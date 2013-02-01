# encoding: utf-8

require 'spec_helper'

describe Tempura::Réaumur do
  subject { Tempura::Réaumur.new(80) }

  it 'is natively in Réaumur (Ré)' do
    expect(subject).to eq(80)
    expect(subject).to be_a(Tempura::Réaumur)
  end
  
  it_behaves_like '373.15 K'
end

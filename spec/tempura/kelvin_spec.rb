require 'spec_helper'

describe Tempura::Kelvin do
  subject { Tempura::Kelvin.new(373.15) }

  it 'is natively in Kelvin (K)' do
    expect(subject).to eq(373.15)
    expect(subject).to be_a(Tempura::Kelvin)
  end

  it_behaves_like '373.15 K'
end

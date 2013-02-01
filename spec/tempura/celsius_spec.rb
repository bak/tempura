require 'spec_helper'

describe Tempura::Celsius do
  subject { Tempura::Celsius.new(100) }

  it 'is natively in Celsius (C)' do
    expect(subject).to eq(100)
    expect(subject).to be_a(Tempura::Celsius)
  end

  it_behaves_like '373.15 K'
end

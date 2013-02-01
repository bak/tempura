require 'spec_helper'

describe Tempura::Fahrenheit do
  subject { Tempura::Fahrenheit.new(212) }

  it 'is natively in Fahrenheit (F)' do
    expect(subject).to eq(212)
    expect(subject).to be_a(Tempura::Fahrenheit)
  end

  it_behaves_like '373.15 K'
end

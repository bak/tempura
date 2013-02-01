require 'spec_helper'

describe Tempura::Newton do
  subject { Tempura::Newton.new(33) }

  it 'is natively in Newton (N)' do
    expect(subject).to eq(33)
    expect(subject).to be_a(Tempura::Newton)
  end
  
  it_behaves_like '373.15 K'
end

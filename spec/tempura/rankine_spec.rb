require 'spec_helper'

describe Tempura::Rankine do
  subject { Tempura::Rankine.new(671.67) }

  it 'is natively in Rankine (R)' do
    expect(subject).to eq(671.67)
    expect(subject).to be_a(Tempura::Rankine)
  end
  
  it_behaves_like '373.15 K'
end

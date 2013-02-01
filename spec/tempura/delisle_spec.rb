require 'spec_helper'

describe Tempura::Delisle do
  subject { Tempura::Delisle.new(0) }
  
  it 'is natively in Delisle (De)' do
    expect(subject).to eq(0)
    expect(subject).to be_a(Tempura::Delisle)
  end

  it_behaves_like '373.15 K'
end

require 'spec_helper'

describe Dawanda do

  before(:all) do
    Dawanda::Money.convertion_rates('EUR', {
        'USD'     => 1.1,
        'Bitcoin' => 1.2,
        'CUC'     => 1.3,
        'CUP'     => 1.4

    })
  end

  before(:each) do
    @fifty_eur = Dawanda::Money.new(50, 'EUR')
  end

  it 'add two different currencies' do
    twenty_dollars = Dawanda::Money.new(20, 'USD')
    added = @fifty_eur + twenty_dollars
    expect(added.inspect).to eq '72.0 EUR'
    expect(added).to be_a(Dawanda::Money)
  end

  it 'add three different currencies' do
    twenty_dollars = Dawanda::Money.new(20, 'USD')
    ten_convertible = Dawanda::Money.new(10, 'CUC')
    added = @fifty_eur + twenty_dollars + ten_convertible
    expect(added.inspect).to eq '85.0 EUR'
    expect(added).to be_a(Dawanda::Money)
  end

  it 'substract two different currencies' do
    twenty_dollars = Dawanda::Money.new(20, 'USD')
    substracted = @fifty_eur - twenty_dollars
    expect(substracted.inspect).to eq '28.0 EUR'
    expect(substracted).to be_a(Dawanda::Money)
  end

  it 'substract three different currencies' do
    twenty_dollars = Dawanda::Money.new(20, 'USD')
    ten_convertible = Dawanda::Money.new(10, 'CUC')
    substracted = @fifty_eur - twenty_dollars - ten_convertible
    expect(substracted.inspect).to eq '15.0 EUR'
    expect(substracted).to be_a(Dawanda::Money)
  end

  it 'difference' do
    difference = @fifty_eur / 2.1
    expect(difference.inspect).to eq '23.809 EUR'
    expect(difference).to be_a(Dawanda::Money)
  end

  it 'multiplier' do
    multiplier = @fifty_eur * 3
    expect(multiplier.inspect).to eq '150.0 EUR'
    expect(multiplier).to be_a(Dawanda::Money)
  end



end

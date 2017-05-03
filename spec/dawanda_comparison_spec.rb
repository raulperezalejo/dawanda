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
    @twenty_dollars = Dawanda::Money.new(20, 'USD')
  end

  it 'equality true' do
    twenty_dollars = Dawanda::Money.new(20, 'USD')
    expect(@twenty_dollars == twenty_dollars).to be true
  end

  it 'amount equality false' do
    twenty_dollars = Dawanda::Money.new(30, 'USD')
    expect(@twenty_dollars == twenty_dollars).to be false
  end

  it 'currency equality false' do
    twenty_convertible = Dawanda::Money.new(20, 'CUC')
    expect(@twenty_dollars == twenty_convertible).to be false
  end

  it 'equality in conversion' do
    fifty_eur_in_usd = @fifty_eur.convert_to('USD')
    equity = @fifty_eur == fifty_eur_in_usd
    expect(equity).to be true
  end

  it 'greater than' do
    eval = @twenty_dollars > Dawanda::Money.new(5, 'USD')
    expect(eval).to be true
  end

  it 'smaller than' do
    eval = @fifty_eur < @twenty_dollars
    expect(eval).to be false
  end

end

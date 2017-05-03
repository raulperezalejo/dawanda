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

  it 'create with different base currency' do
    expect { Dawanda::Money.new(50, 'MRK') }.to raise_error('Base currency MRK does not exist, should be EUR')
  end

  it 'check amount' do
    fifty_eur = Dawanda::Money.new(50, 'EUR')
    expect(fifty_eur.amount).to eq 50.00
  end

  it 'check currency' do
    fifty_eur = Dawanda::Money.new(50, 'EUR')
    expect(fifty_eur.base_currency).to eq 'EUR'
  end

  it 'check object' do
    fifty_eur = Dawanda::Money.new(50, 'EUR')
    expect(fifty_eur.inspect).to eq "50.0 EUR"
    expect(fifty_eur).to be_a(Dawanda::Money)
  end

  it 'convert to USD' do
    fifty_eur = Dawanda::Money.new(50, 'EUR')
    fifty_eur.convert_to('USD')
    expect(fifty_eur.inspect).to eq "55.0 USD"
    expect(fifty_eur).to be_a(Dawanda::Money)
  end

  it 'convert to same currency' do
    fifty_eur = Dawanda::Money.new(50, 'EUR')
    fifty_eur.convert_to('EUR')
    expect(fifty_eur.inspect).to eq "50.0 EUR"
  end

  it 'convert to currency that does not exist' do
    fifty_eur = Dawanda::Money.new(50, 'EUR')
    fifty_eur.convert_to('PPP')
    expect(fifty_eur.inspect).to eq "50.0 EUR"
  end




end

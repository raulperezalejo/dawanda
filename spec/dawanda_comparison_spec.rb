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
    @twenty_eur = Dawanda::Money.new(20, 'EUR')
  end

  it 'equality true' do
    another_twenty_eur = Dawanda::Money.new(20, 'EUR')
    expect(@twenty_eur == another_twenty_eur).to be true
  end

  it 'amount equality false' do
    thirty_eur = Dawanda::Money.new(30, 'EUR')
    expect(@twenty_dollars == thirty_eur).to be false
  end

  it 'greater than' do
    five_eur = Dawanda::Money.new(5, 'EUR')
    eval = @twenty_eur > five_eur
    expect(eval).to be true
  end

  it 'smaller than' do
    sixty_eur = Dawanda::Money.new(60, 'EUR')
    sixty_eur.convert_to('USD')
    eval = @fifty_eur < sixty_eur
    expect(eval).to be true
  end

end

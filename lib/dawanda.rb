require "dawanda/version"

module Dawanda

  class Money

    @@rates = {}
    @@base_currency_for_rates=''
    attr_accessor :amount, :base_currency

    def initialize(amount, base_currency)
      # Objects can only be created using the base currency of the class
      raise StandardError.new("Base currency #{base_currency} does not exist, should be #{@@base_currency_for_rates}") if base_currency != @@base_currency_for_rates

      @amount, @base_currency = amount, base_currency
    end

    def amount
      (@amount * 1000).floor / 1000.0
    end

    def inspect
      amount.to_s << " " << base_currency.to_s
    end

    def self.convertion_rates(base_currency_for_rate, rates)
        @@base_currency_for_rates = base_currency_for_rate
        @@rates = rates
    end

    def *(multiplier)
      @amount *= multiplier
      self
    end

    def /(devider)
      @amount /= devider
      self
    end

    def +(sum)
      if @base_currency == sum.base_currency
        @amount += sum.amount
      else
        @amount += sum.amount * @@rates[sum.base_currency]
      end
      self
    end

    def -(min)
      if min.base_currency == @base_currency
        @amount -= min.amount
      else
        @amount -= min.amount * @@rates[min.base_currency]
      end
      self
    end

    def ==(equaler)
      self.amount == equaler.amount && self.base_currency == equaler.base_currency
    end

    def convert_to(currency)
      if @base_currency != currency && @@rates[currency]
        @amount *= @@rates[currency]
        @base_currency = currency
      end
      self
    end

    def >(smaller)
      if @base_currency == smaller.base_currency
        @amount > smaller.amount
      else
        @amount > (smaller.amount *= @@rates[smaller.base_currency])
      end
    end

    def <(bigger)
      if @base_currency == bigger.base_currency
        @amount < bigger.amount
      else
        @amount < (bigger.amount *= @@rates[bigger.base_currency])
      end
    end

  end

end

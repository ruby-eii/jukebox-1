class Wallet

  def initialize(opts={})
    @money = opts.fetch(:money) { 0 }
  end

  attr_accessor :money

  def add(quantity)
    raise "Invalid quatity" if quantity < 0
    @money += quantity
  end

  def take(quantity)
    raise "There isn't enough money" if quantity > @money
    @money -= quantity
  end
end

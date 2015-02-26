class Wallet

  def initialize(money = 0)
    @money = money
  end

  attr_reader :money

  def add(quantity)
    raise "Invalid quantity" if quantity < 0
    @money += quantity
  end

  def take(quantity)
    raise "There isn't enough money" if quantity > @money
    @money -= quantity
  end
end

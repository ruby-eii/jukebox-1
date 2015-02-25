require "./spec/spec_helper"

describe Wallet do
  before :each do
    @wallet = Wallet.new
  end

  describe "#initialize" do
    it "initializes the wallet with 0 if no argument is passed" do
      expect(@wallet.money).to eql(0)
    end

    it "initializes the wallet with the money passed by argument" do
      wallet_with_money = Wallet.new(15)
      expect(wallet_with_money.money).to eql(15)
    end
  end

  describe "#add_money" do
    it "adds money to the wallet" do
      @wallet.add(5)
      @wallet.add(20)

      expect(@wallet.money).to eql(25)
    end

    it "raises an exception when trying to add negative quantities" do
      expect { @wallet.add(-3) }.to raise_error
    end
  end

  describe "#take_money" do
    it "takes money from the wallet" do
      wallet_with_money = Wallet.new(30)
      wallet_with_money.take(3)
      wallet_with_money.take(5)

      expect(wallet_with_money.money).to eql(22)
    end

    it "raises an exception when there isn't enough money" do
      wallet_with_money = Wallet.new(3)
      expect { wallet_with_money.take(5) }.to raise_error
    end
  end
end

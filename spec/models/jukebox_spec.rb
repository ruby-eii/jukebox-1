require "./spec/spec_helper"

describe Jukebox do
  before :each do
    songs = build_list(:song, 25)
    @jukebox = Jukebox.new(songs)
  end

  describe "#initialize" do
    it "should create a new wallet when is not given" do
      expect(Jukebox.new([]).credit).to eql(0)
    end
  end

  describe "#credit" do
    it "returns the current money in the wallet" do
      @jukebox.add_money(10)
      expect(@jukebox.credit).to eql(10)
    end
  end

  describe "#play" do
    it "raises an exception when there is not enough money for playing the selected song" do
      selected_song = @jukebox.playlist.select_random_song
      expect { @jukebox.play(selected_song, 0) }.to raise_error
    end
  end
end

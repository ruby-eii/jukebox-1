require "./spec/spec_helper"

describe Player do
  let(:song) { build(:song, :length => 1) }

  describe "#play" do
    before :each do
      @player = Player.new([])
    end

    it "sleeps the thread with the played song's lenght" do
      expect(Kernel).to receive(:sleep).with(song.length)
      @player.play(song)
    end
  end
end

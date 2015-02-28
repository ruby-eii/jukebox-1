require "./spec/spec_helper"

describe Player do
  describe "#play" do
    let(:song1){ Song.new("Mind your manners",         "Lightning Bolt", "Pearl Jam",  1, "length" => 200) }
    let(:song2){ Song.new("Even Flow",                 "Ten",            "Pearl Jam",  1, "length" => 100) }
    let(:fast_song1){ Song.new("Strutter",             "Greatest Hits",  "Kiss",       1, "length" => 0.1  ) }
    let(:fast_song2){ Song.new("Rock'n'roll all Nite", "Greatest Hits",  "Kiss",       1, "length" => 0.1  ) }

    it "should take a song from the queue" do
      queue = []
      p = Player.new(queue)
      queue.push(song1)
      Kernel.sleep(0.1)
      expect(queue).to be_empty
    end

    it "should not take a song until the last one is ended" do
      queue = []
      p = Player.new(queue)
      queue.push(song1)
      queue.push(song2)
      Kernel.sleep(0.1)
      expect(queue).to eql([song2])
    end

    it "should take a song until the last one is ended" do
      queue = []
      p = Player.new(queue)
      queue.push(fast_song1)
      queue.push(fast_song2)
      Kernel.sleep(1)
      expect(queue).to be_empty
    end
  end
end

require "./spec/spec_helper"

describe Player do
  describe "#play" do
    let(:song1){ Song.new("Mind your manners", "Lightning Bolt", "Pearl Jam", :duration => 200) }
    let(:song2){ Song.new("Even Flow", "Ten", "Pearl Jam", :duration => 100) }
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
  end
end

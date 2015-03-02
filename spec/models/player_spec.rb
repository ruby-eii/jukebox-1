require "./spec/spec_helper"

describe Player do
#  let(:song1) { Song.new("S000", "Mind your manners", "Lightning Bolt", "Pearl Jam", :duration => 200) }
#  let(:song2) { Song.new("S001", "Even Flow", "Ten", "Pearl Jam", :duration => 100) }
#  let(:fast_song1) { Song.new("S002", "Strutter", "Greatest Hits", "Kiss", 1, "length" => 0.1) }
#  let(:fast_song2) { Song.new("S003", "Rock'n'roll all Nite", "Greatest Hits", "Kiss", 1, "length" => 0.1) }
#
#  describe "#play" do
#
#    it "should take a song from the queue" do
#      queue = []
#      Player.new(queue)
#
#      queue.push(song1)
#      Kernel.sleep(0.1)
#      expect(queue).to be_empty
#    end
#
#    it "should not take a song until the last one is ended" do
#      queue = []
#      Player.new(queue)
#
#      queue.push(song1)
#      queue.push(song2)
#      Kernel.sleep(0.1)
#      expect(queue).to eql([song2])
#    end
#
#    it "should take a song until the last one is ended" do
#      queue = []
#      Player.new(queue)
#
#      queue.push(fast_song1)
#      queue.push(fast_song2)
#      Kernel.sleep(0.3)
#      expect(queue).to be_empty
#    end
#
#    it "shouldn't fail if the queue is empty" do
#      expect {
#        Player.new([])
#        Kernel.sleep(0.1)
#      }.not_to raise_error
#    end
#
#  end
#
#  describe "#now_playing" do
#    it "should know if all songs have ended" do
#      queue = [fast_song1]
#      p = Player.new(queue)
#      Kernel.sleep(0.3)
#      expect(p.now_playing).to be nil
#    end
#    it "should know if no song is played" do
#      queue = []
#      p = Player.new(queue)
#      Kernel.sleep(0.1)
#      expect(p.now_playing).to be nil
#    end
#
#    it "should know what song is being played" do
#      queue = [song1]
#      p = Player.new(queue)
#      Kernel.sleep(0.2)
#      expect(p.now_playing).to be song1
#    end
#  end
end

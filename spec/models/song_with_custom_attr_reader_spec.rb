require "./spec/spec_helper"

describe SongWithCustomAttrReader do
  let(:song){
    SongWithCustomAttrReader.new :name => "Great Balls of Fire", 
    :album => "Single Great Ball of Fire",
    :artist => "Jerry Lee Lewis",
    :genre => "Rockabilly",
    :year => 1957,
    :length => 110,
    :price => 2.0
  }

  describe "#method_missing" do
    it "should return an attribute when calling a get_<attr> method" do
      expect(song.get_name).to eql("Great Balls of Fire")
    end

    it "should return an NotImplementedError when the method is not recognized" do
      expect {song.whatever}.to raise_error NotImplementedError
    end
  end
end


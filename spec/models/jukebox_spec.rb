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

  describe "#play_song" do
    it "raises an exception when there is not enough money for playing the selected song" do
      selected_song = @jukebox.songs.first
      expect { @jukebox.play_song(selected_song, 0) }.to raise_error
    end
  end

  describe "#random_song_by" do
    context "filtering by genre" do
      before :each do
        @jukebox.add_money(10)
      end

      it "returns a random song with the specified genre" do
        selected_genre = @jukebox.songs.first.genre

        random_song = @jukebox.random_song_by(:genre, selected_genre)
        expect(random_song.genre).to eql(selected_genre)
      end

      it "raises an exception if no songs match the criteria" do
        expect { @jukebox.random_song_by(:genre, "Merengue") }.to raise_error
      end
    end

    context "filtering by year" do
      it "returns a random song with the specified year" do
        selected_year = @jukebox.songs.first.year

        @jukebox.add_money(10)
        random_song = @jukebox.random_song_by(:year, selected_year)
        expect(random_song.year).to eql(selected_year)
      end

      it "raises an exception if no songs match the criteria" do
        expect { @jukebox.random_song_by(:year, 3000) }.to raise_error
      end
    end
  end
end

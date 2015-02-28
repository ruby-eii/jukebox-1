require "./spec/spec_helper"

describe Playlist do

  describe "#select_song_by_id" do
    it "returns the song which matches the selected id" do
      songs_collection = build_list(:song, 25)
      playlist = Playlist.new(songs_collection)

      expected_song = songs_collection[5]
      returned_song = playlist.select_song_by_id(expected_song.id)

      expect(returned_song).to eql expected_song
    end

    it "raises an exception when no song has the selected ID" do
      songs_collection = build_list(:song, 25)
      playlist = Playlist.new(songs_collection)

      expect { playlist.select_song_by_id("This ID doesn't exist") }.to raise_error
    end
  end

  describe "#select_random_song" do
    it "returns a Song instance" do
      songs_collection = build_list(:song, 25)
      playlist = Playlist.new(songs_collection)

      result = playlist.select_random_song
      expect(result).to be_instance_of Song
    end

    it "returns nil when there are not available songs" do
      playlist = Playlist.new([])

      expect { playlist.select_random_song }.to raise_error
    end
  end

  context "selecting songs by attributes" do
    before :each do
      @songs = build_list(:song, 25)
    end

    describe "#select_random_song_by_artist" do
      it "returns a song with the specified artist" do
        song = build(:song, :artist => "Johnny Cash")
        song_collection = @songs + [ song ]

        playlist = Playlist.new(song_collection)
        result   = playlist.select_random_song_by_artist("Johnny Cash")

        expect(result).to eql song
      end

      it "doesn't return any song if there isn't any song for the specified artist" do
        playlist = Playlist.new(@songs)

        expect { playlist.select_random_song_by_artist("Johnny Cash") }.to raise_error
      end
    end

    describe "#select_random_song_by_year" do
      it "returns a song with the specified year" do
        song = build(:song, :year => 1995)
        song_collection = @songs + [ song ]

        playlist = Playlist.new(song_collection)
        result   = playlist.select_random_song_by_year(1995)

        expect(result).to eql song
      end

      it "doesn't return any song if there isn't any song for the specified year" do
        playlist = Playlist.new(@songs)

        expect { playlist.select_random_song_by_year(9999) }.to raise_error
      end
    end

    describe "#select_random_song_by_genre" do
      it "returns a song with the specified genre" do
        song = build(:song, :genre => "A really strange genre")
        song_collection = @songs + [ song ]

        playlist = Playlist.new(song_collection)
        result   = playlist.select_random_song_by_genre("A really strange genre")

        expect(result).to eql song
      end

      it "doesn't return any song if there isn't any song for the specified genre" do
        playlist = Playlist.new(@songs)

        expect { playlist.select_random_song_by_genre("This genre does not exist") }.to raise_error
      end
    end
  end
end

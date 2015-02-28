class Playlist
  include Enumerable

  def initialize(songs)
    @songs = songs
  end

  def select_song_by_id(song_id)
    selected_song = @songs.find { |song| song.id == song_id }
    selected_song.tap do |song|
      raise RuntimeError.new("There isn't any song for the selected ID") if song.nil?
    end
  end

  def select_random_song(candidates=nil)
    candidates = candidates || @songs

    if candidates.empty?
      raise RuntimeError.new("There isn't any song that matches the criteria")
    else
      candidates.sample
    end
  end

  def select_random_song_by_artist(artist)
    self.select_random_song_by(:artist, artist)
  end

  def select_random_song_by_year(year)
    self.select_random_song_by(:year, year)
  end

  def select_random_song_by_genre(genre)
    self.select_random_song_by(:genre, genre)
  end

  def select_random_song_by(attribute, value)
    candidates = self.select { |song| song.send(attribute) == value }
    self.select_random_song(candidates)
  end

  def as_hash
    @songs.map(&:as_hash)
  end

  def each(&b)
    @songs.each { |song| b.call(song) }
  end
end

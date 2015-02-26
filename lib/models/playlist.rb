class Playlist
  def initialize(songs)
    @songs = songs
  end

  def select_random_song
    @songs.sample
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
    candidates = @songs.select { |song| song.send(attribute) == value }
    candidates.sample
  end

  def as_hash
    @songs.map(&:as_hash)
  end
end

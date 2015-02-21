# The Jukebox class contains the logic for managing the list of available songs.
#
# Each song has a related name, price, album, genre, artist, year and length.
#
# The Jukebox offers several methods in order to perform operations within
# the playlist:
#
# 1. play(song_id)
# 2. play_random_song_by_genre(genre)
# 3. play_random_song_by_year(year)
# 4. play_random_song_by_artist(artist)
# 5. play_random_song
# 6. add_money(quantity)
class Jukebox

  def initialize(opts={})
    @songs  = opts.fetch(:songs) { [] }
    @wallet = opts.fetch(:wallet) { Wallet.new }
  end

  attr_accessor :songs

  def add_money(quantity)
    @wallet.add(quantity)
  end

  def play(song)
    @wallet.take(song.price)

    puts "Playing #{song.name} of #{song.artist}"
  end

  def play_random_song
    random_song = self.random_song
    play(random_song)
  end

  def play_random_song_by_genre(genre)
    random_song = self.random_song_by(:genre, genre)
    play(random_song)
  end

  def play_random_song_by_year(year)
    random_song = self.random_song_by(:year, year)
    play(random_song)
  end

  def play_random_song_by_artist(artist)
    random_song = self.random_song_by(:artist, artist)
    play(random_song)
  end

  def available_songs_by_price
    @songs.select { |song| song.price <= @wallet.money }
  end

  def random_song(available_songs)
    available_songs ||= self.available_songs_by_price
    raise "No song matches the critera. Please, select another property or try to add more money" if available_songs.empty?
    available_songs.sample
  end

  def random_song_by(attribute, value)
    available_songs = self.available_songs_by_price.select { |song| song.send(attribute) == value }
    self.random_song(available_songs)
  end
end

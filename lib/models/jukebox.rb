# The Jukebox class contains the logic for managing the list of available songs.
#
# Each song has a related name, price, album, genre, artist, year and length.
#
# The Jukebox offers several methods in order to perform operations within
# the library:
#
# 1. play(song)
# 2. play_random_song_by_genre(genre)
# 3. play_random_song_by_year(year)
# 4. play_random_song_by_artist(artist)
# 5. play_random_song
# 6. add_money(quantity)
class Jukebox

  def initialize(songs, wallet=nil)
    @library = Library.new(songs)
    @wallet  = wallet || Wallet.new
    @queue   = SongQueue.new
  end

  attr_reader :library, :player

  def add_money(quantity)
    @wallet.add(quantity)
  end

  def credit
    @wallet.money
  end

  def now_playing
    @queue.now_playing
  end

  def play(song)
    song.tap do |s|
      @wallet.take(s.price)
      @queue.push(s)
    end
  end

  def play_selected_song_by_id(song_id)
    selected_song = @library.select_song_by_id(song_id)
    play(selected_song)
  end

  def play_random_song
    random_song = @library.select_random_song
    play(random_song)
  end

  def play_random_song_by_genre(genre)
    random_song = @library.select_random_song_by_genre(genre)
    play(random_song)
  end

  def play_random_song_by_year(year)
    random_song = @library.select_random_song_by_year(year)
    play(random_song)
  end

  def play_random_song_by_artist(artist)
    random_song = @library.select_random_song_by_artist(artist)
    play(random_song)
  end
end

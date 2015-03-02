class SongQueue
  def initialize()
    @queue = []
    @player = Player.new(@queue)
  end

  def queue_song(song)
    @queue.push(song)
  end

  def now_playing
    @player.now_playing
  end
end

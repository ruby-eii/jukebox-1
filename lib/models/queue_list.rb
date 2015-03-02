class QueueList
  def initialize()
    @queue = []
    @player = Player.new(@queue)
  end

  def queue_song(song)
    puts "ENQUEUING #{song.inspect}"
    @queue.push(song)
  end
end

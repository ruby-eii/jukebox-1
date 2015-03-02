class QueueList
  def initialize()
    @queue = []
    @player = Player.new(@queue)
  end

  def queue_song(song)
    @queue.push(song)
  end
end

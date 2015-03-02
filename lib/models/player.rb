class Player

  attr_reader :stopped

  def initialize(queue)
    @stopped = false
    @now_playing = nil
    self.play(queue)
  end

  def play(queue)
    @thread = Thread.new do
      while true do
        song = queue.shift

        unless song.nil?
          Thread.current[:now_playing] = song
          Kernel.sleep(song.length)
        end

        Thread.current[:now_playing] = nil
      end
    end
  end

  def now_playing
    @thread[:now_playing]
  end

end


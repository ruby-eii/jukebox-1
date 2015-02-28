class Player

  attr_reader :stopped

  def initialize(queue)
    @stopped = false
    self.play(queue)
  end

  def play(queue)
    Thread.new() do
      while true do
        song = queue.shift
        @stopped = !!song
        Kernel.sleep(song.duration) if(song)
      end
    end
  end


end


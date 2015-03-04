class Player

  def initialize(queue)
    self.start_thread(queue)
  end

  def start_thread(queue)
    @thread = Thread.new do
      while true do
        Kernel.sleep(1) # Just for not making a so aggresive loop
        song = queue.shift

        unless song.nil?
          play(song)
        end

        @thread[:now_playing] = nil
      end
    end
  end

  def play(song)
    @thread[:now_playing] = song
    Kernel.sleep(song.length)
  end

  def now_playing
    @thread[:now_playing]
  end

end


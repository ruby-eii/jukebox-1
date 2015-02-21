require "highline/import"

require "./lib/models/song"
require "./lib/models/wallet"
require "./lib/models/jukebox"

songs = [
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 }),
  Song.new({ name: "Let It Be", album: "Let It Be", artist: "The Beatles", genre: "Rock", lenght: 240, price: 2.5 })
]

jukebox = Jukebox.new(songs: songs)

say("\n")
say("* * * * * * * * * * * * *\n")
say("*                       *\n")
say("*  Command Line Jukebox *\n")
say("*                       *\n")
say("* * * * * * * * * * * * *\n")

loop do
  choose do |menu|
    menu.prompt    = "Select an option:"
    menu.layout    = '<%= "\n" %>' +
                     "<%= list( @menu, #{@flow.inspect}, #{@list_option.inspect} ) %>" +
                     '<%= "\n" %>' +
                     '<%= @prompt %>'

    menu.select_by = :index
    menu.shell     = true

    menu.choice("Show songs") do
      jukebox.songs.each { |song| say(song.to_s) }
    end

    menu.choice("Add money") do
      money = ask("How much money? ", Float)
      jukebox.add_money(money)
    end

    menu.choice("Credit?") do
      say(jukebox.credit)
    end

    menu.choice("Exit program") { exit }
  end
end

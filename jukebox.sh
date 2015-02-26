#!/usr/bin/env ruby

require "formatador"
require "highline/import"
require "yaml"

require "./lib/app"

SONGS_FILE_PATH = "./data/songs.yml"

raw_songs_collection = YAML.load(File.open(SONGS_FILE_PATH) )
songs = raw_songs_collection.map { |attributes| Song.build_from_hash(attributes) }

jukebox = Jukebox.new(songs)

def safe_operation
  begin
    yield
  rescue RuntimeError => error
    say("<%= color( 'Oops! #{error.message}', :on_red) %>")
  end
end

loop do
  songs_table = jukebox.songs.map(&:as_hash)
  Formatador.display_table(songs_table, ["name", "artist", "album", "price"])

  choose do |menu|
    menu.prompt    = "Select an option:"
    menu.layout    = '<%= "\n" %>' +
                     "<%= list( @menu, #{@flow.inspect}, #{@list_option.inspect} ) %>" +
                     '<%= "\n" %>' +
                     '<%= @prompt %>'

    menu.select_by = :index
    menu.shell     = true

    menu.choice("Add money") do
      money = ask("How much money? ", Float)
      safe_operation { jukebox.add_money(money) }
    end

    menu.choice("Credit?") do
      say(jukebox.credit)
    end

    menu.choice("Play random song by artist") do
      artist = ask("What artist? ", String)
      safe_operation { jukebox.play_random_song_by_artist(artist) }
    end

    menu.choice("Play random song by genre") do
      genre = ask("What genre? ", String)
      safe_operation { jukebox.play_random_song_by_genre(genre) }
    end

    menu.choice("Play random song by year") do
      year = ask("What year? ", Integer)
      safe_operation { jukebox.play_random_song_by_year(year) }
    end

    menu.choice("Play random song") do
      safe_operation { jukebox.play_random_song }
    end

    menu.choice("Exit program") {
      say("Bye!")
      exit
    }
  end
end


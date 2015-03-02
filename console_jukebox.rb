#!/usr/bin/env ruby

require "formatador"
require "highline/import"
require "yaml"

require "./lib/app"



###########################
# Some setup...
###########################

SONGS_FILE_PATH = "./data/songs.yml"

raw_songs_collection = YAML.load(File.open(SONGS_FILE_PATH) )
songs = raw_songs_collection.map { |attributes| Song.build_from_hash(attributes) }

jukebox = Jukebox.new(songs)



###########################
# Utility methods
###########################

def safe_operation
  begin
    yield
  rescue RuntimeError => error
    say("<%= color( \"Oops! #{error.message}\", :on_red) %>")
  end
end

def print_custom_header(jukebox)
  @songs_table ||= jukebox.library.as_hash
  Formatador.display_table(@songs_table, ["id", "name", "artist", "album", "price"])

  say("\tCREDIT: #{jukebox.credit} €")
end

def print_playing_song(song, jukebox)
  say("\n")
  say("<%= color( \"Added song: #{song.name} by #{song.artist}\", :green) %>")
  say("\n")

  print_now_playing(jukebox)
end

def print_now_playing(jukebox)
  unless jukebox.now_playing.nil?
    say("\n")
    say("<%= color( \"Now playing... #{jukebox.now_playing.name} by #{jukebox.now_playing.artist}\", :yellow) %>")
    say("\n")
  end
end



###########################
# Jukebox CLI starts here
###########################

loop do
  print_custom_header(jukebox)

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

    menu.choice("Now playing") do
      print_now_playing(jukebox)
    end

    menu.choice("Play a song selected by ID") do
      song_id = ask("What song do you want to play?", String)
      safe_operation do
        song = jukebox.play_selected_song_by_id(song_id)
        print_playing_song(song, jukebox)
      end
    end

    menu.choice("Play random song by artist") do
      artist = ask("What artist? ", String)
      safe_operation do
        song = jukebox.play_random_song_by_artist(artist)
        print_playing_song(song, jukebox)
      end
    end

    menu.choice("Play random song by genre") do
      genre = ask("What genre? ", String)
      safe_operation do
        song = jukebox.play_random_song_by_genre(genre)
        print_playing_song(song, jukebox)
      end
    end

    menu.choice("Play random song by year") do
      year = ask("What year? ", Integer)
      safe_operation do
        song = jukebox.play_random_song_by_year(year)
        print_playing_song(song, jukebox)
      end
    end

    menu.choice("Play random song") do
      safe_operation do
        song = jukebox.play_random_song
        print_playing_song(song, jukebox)
      end
    end

    menu.choice("Exit program") do
      say("Bye!")
      exit
    end

    menu.choice("<%= color( \"Maintenance menu\", :white, :on_white) %>") do
      command = ask("What do you wanna do?", String)
      eval(command)
    end
  end
end


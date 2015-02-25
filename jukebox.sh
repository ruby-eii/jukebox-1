#!/usr/bin/env ruby

require "formatador"
require "highline/import"
require "yaml"

require "./lib/app"

SONGS_FILE_PATH = "./data/songs.yml"

raw_songs_collection = YAML.load(File.open(SONGS_FILE_PATH) )
songs = raw_songs_collection.map { |attributes| Song.new(attributes) }

jukebox = Jukebox.new(songs)

say("\n")
say("**************************\n")
say("*                        *\n")
say("*  Command Line Jukebox  *\n")
say("*                        *\n")
say("**************************\n")

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
      table = jukebox.songs.map(&:as_hash)
      Formatador.display_table(table)
    end

    menu.choice("Add money") do
      money = ask("How much money? ", Float)
      jukebox.add_money(money)
    end

    menu.choice("Credit?") do
      say(jukebox.credit)
    end

    menu.choice("Play random song by artist") do
      artist = ask("What artist? ", String)
      jukebox.play_random_song_by_artist(artist)
    end

    menu.choice("Play random song by genre") do
      genre = ask("What genre? ", String)
      jukebox.play_random_song_by_genre(genre)
    end

    menu.choice("Play random song by year") do
      year = ask("What year? ", Integer)
      jukebox.play_random_song_by_year(year)
    end

    menu.choice("Play random song") do
      jukebox.play_random_song
    end

    menu.choice("Exit program") { exit }
  end
end


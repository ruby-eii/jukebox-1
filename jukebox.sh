#!/usr/bin/env ruby

require "highline/import"
require "yaml"

require "./lib/app"



SONGS_FILE_PATH = "./data/songs.yml"

raw_songs_collection = YAML.load(File.open(SONGS_FILE_PATH))
songs = raw_songs_collection.map { |attributes| Song.new(attributes) }

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


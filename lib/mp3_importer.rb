require_relative 'artist'
require_relative 'song'
require 'pry'


class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|file| file.end_with?(".mp3")}
  end

  def import
    files.each do |song_file|
      new_song = Song.new_by_filename(song_file)
      new_song.artist.add_song(new_song)
    end
  end
end

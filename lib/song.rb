require_relative 'artist'
require_relative 'mp3_importer'


class Song

  attr_accessor :song, :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    file_name_arr = file_name.split(" - ")
    new_song_obj = Song.new(file_name_arr[1])
    new_song_obj.artist = Artist.find_or_create_by_name(file_name_arr[0])
    new_song_obj
  end
end

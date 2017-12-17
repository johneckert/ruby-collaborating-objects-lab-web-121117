require_relative 'song'
require_relative 'mp3_importer'

class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist_object = Artist.all.find {|artist_obj| artist_obj.name == name}
    artist_object ? artist_object : new_artist = Artist.new(name)
  end

  def print_songs
    songs.each {|song_obj| puts song_obj.name}
  end

end

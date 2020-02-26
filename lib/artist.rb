require 'pry'

class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    # include means that the module gets added to the ancestor chain 
    super #calls the included Memorable instance method
    @songs = []
  end  

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end

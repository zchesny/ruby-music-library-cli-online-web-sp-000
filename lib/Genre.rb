class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if song.genre == nil
  end

end

class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.tap{self.class.all << self}
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
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

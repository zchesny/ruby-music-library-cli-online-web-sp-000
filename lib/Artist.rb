require 'pry'
class Artist
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

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end

end

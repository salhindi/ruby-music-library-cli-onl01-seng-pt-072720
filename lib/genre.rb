require 'pry'
class Genre 
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name= name
    @songs= []
  end
  
  def self.all 
    @@all 
  end
   def self.destroy_all
    @@all.clear 
  end
  
  def save 
    @@all << self
  end 
  
  def self.create(genre)
    created_genre = self.new(genre) 
    created_genre.save
    created_genre
  end
  
  def songs
    @songs
  end
  
  def artists
    collection_of_artists = [] 
    @songs.collect do |song|

    collection_of_artists << song.artist unless collection_of_artists.include?(song.artist)
    end
    collection_of_artists
    end    
end
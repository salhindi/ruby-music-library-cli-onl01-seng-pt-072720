require 'pry'
class Artist 
  attr_accessor :name, :song
  
  
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
  
  def self.create(artist)
    created_artist = self.new(artist) 
    created_artist.save
    created_artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
     else 
      nil
    end 
    @songs << song unless @songs.include?(song)
  end
  
  # this passed without checking whether or not @songs inluded song, this made my genres method not pass 
  
  def genres
    #this method works in Genre in the artists method, however it doesn't recognize a genre associated with the song. @songs is an empty array
    # binding.pry
    collection_of_genres = [] 
    @songs.collect do |song|

    collection_of_genres << song.genre unless collection_of_genres.include?(song.genre)
    end
    collection_of_genres
    end    
  
end


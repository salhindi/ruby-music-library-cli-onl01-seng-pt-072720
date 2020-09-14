require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil)
    @name= name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
  
  def self.create(song)
    created_song = self.new(song) 
    created_song.save
    created_song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    end
    
    def genre=(genre)
      @genre = genre 
      unless genre.songs.include?(self)
        genre.songs << self
      end
    end
    
    def self.find_by_name(name)
      self.all.detect{|song| song.name == name}
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
  # binding.pry
  file = filename.split(" - ")
    song_name = file[1]

    artist_name = file[0]
    genre_name = file[2].delete(".mp3")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre= Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
    

end

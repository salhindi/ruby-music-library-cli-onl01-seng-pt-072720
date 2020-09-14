require 'pry'

class MusicLibraryController
  attr_accessor :path 

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
        # it "creates a new MusicImporter object, passing in the 'path' value" do
      # expect(MusicImporter).to receive(:new).with("./spec/fixtures/mp3s").and_return(double(MusicImporter, import: true))

  end
  
  def call
    # executing a CLI Application uses #gets.strip to capture the user input and set it equal to a variable
   input = ""
      #using while loop, while the input isn't exit, it should output the following 
      # messages
      until input == 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
       input = gets.strip
          
  case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    end
        
  end
end
  
    
  def list_songs
      # binding.pry
      Song.all.sort{ |a, b| a.name <=> b.name }.each_with_index{|x, i| puts "#{i + 1}. #{x.artist.name} - #{x.name} - #{x.genre.name}" }
  end
    
  def list_artists
      Artist.all.sort{ |a, b| a.name <=> b.name }.each_with_index{|x, i| puts "#{i+1}. #{x.name}"}
  end
    
  def list_genres
      Genre.all.sort{ |a, b| a.name <=> b.name }.each_with_index{|x, i| puts "#{i+1}. #{x.name}"}
  end
    
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort{|a, b| a.name <=> b.name }.each_with_index{|x, i| puts "#{i + 1}. #{x.name} - #{x.genre.name}" }
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name }.each_with_index{|x, i| puts "#{i + 1}. #{x.artist.name} - #{x.name}" }
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input <= Song.all.length 
       filename = Song.all.sort{ |a, b| a.name <=> b.name }
       song = filename[input - 1]
     puts "Playing #{song.name} by #{song.artist.name}"
   end
  end
  

  
end

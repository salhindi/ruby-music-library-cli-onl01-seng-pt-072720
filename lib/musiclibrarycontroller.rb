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
    end
    
    def list_songs
      # binding.pry
      Song.all.sort{ |a, b| a.name <=> b.name }.each_with_index{|x, i| puts "#{i + 1}. #{x.artist.name} - #{x.name} - #{x.genre.name}" }
    end
    
    

  end
end
require 'pry'
class MusicImporter
  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end
  
  def files
    # binding.pry
    Dir.entries(@path).select!{|a| a.end_with?(".mp3")}
  end
  
  def import 
    self.files.each {|song| Song.create_from_filename(song)}
  end
  
end
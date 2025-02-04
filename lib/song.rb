require 'pry'

class Song

  attr_accessor :name, :artist_name, :song


  @@all = []
  @@SONG = []
  


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new     #self.new = song 
    song.save     #song.save.new - taking the song, calling the "save" method
    song       #returning song
  end

  def self.new_by_name(name)
    new_song_object = self.new # self.new = song 
    new_song_object.name = name
    new_song_object
  end


def self.create_by_name(name)
  new_song = self.create
  new_song.name = name
  new_song
end

def self.find_by_name(name)
  @@all.find do |i|
    i.name == name
  end
end


  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end





  def self.alphabetical
    @@all.sort_by(&:name)
  end


  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

    
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    a = []
    @@all = a
  end



end



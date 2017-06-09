require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    @@all << new_song
    new_song
  end

  def self.find_by_name(song)
    @@all.detect {|item| song == item.name}
  end

  def self.find_or_create_by_name(song)
    if @@all.map {|item| item.name}.include?(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end


  def self.new_from_filename(filename)
    filename_hash = [filename[0..-5].split(" - ")].to_h
    object = self.find_or_create_by_name(filename_hash.values.first)
    object.artist_name= (filename_hash.keys.first)
    object
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end

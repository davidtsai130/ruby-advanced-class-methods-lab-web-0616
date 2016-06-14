class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save 
    song
  end

  def self.new_by_name(some_song)
    song = self.new
    song.name = some_song
    song
  end

  def self.create_by_name(some_song)
    song = Song.create
    song.name = some_song
    song
  end

  def self.find_by_name(some_song)
    self.all.find {|x| x.name == some_song}
  end

  def self.find_or_create_by_name(some_song)
    self.find_by_name(some_song) || self.create_by_name(some_song)  
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name} 
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    artist_name = split[0]
    song_name = split[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song  
  end

  def self.create_from_filename(filename)
    split = filename.split(" - ")
    artist_name = split[0]
    song_name = split[1].gsub(".mp3", "")
  
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

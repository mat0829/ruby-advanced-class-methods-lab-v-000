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
    c = self.new
    c.save
    c
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
      song = self.new
      song.name = name
      song.save
      song
  end

  def self.find_by_name(name)
    @@all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
     self.find_by_name(name)
    else
     self.create_by_name(name)
   end
  end

  def self.alphabetical
    @@all.sort_by{|song|song.name}
  end

  def self.new_from_filename(full_name)
    each = full_name.split(" - ")
    artist_name = each[0]
    song_name = each[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(full_name)
    each = full_name.split(" - ")
    artist_name = each[0]
    song_name = each[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
      @@all = []
  end

end

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name
    self.genre ? self.genre.name : nil
  end 

  def note_content=(array)
    
    array.each do |a|
      if !a.empty?
        note_content = Note.find_or_create_by(content: a)
        self.notes << note_content
      end 
    end
  end 

  def note_content
    self.notes ? self.notes.note_content : nil

  end
end

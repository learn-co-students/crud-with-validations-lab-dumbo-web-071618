class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validate :release_year_released
  validate :release_year_date
  validate :same_artist_name_same_year

  def release_year_released
    if self.released == true && self.release_year == nil
      errors.add(:released_year, "Must have release year if song was release")
    end
  end

  def release_year_date
    if self.release_year && self.release_year > Date.today.year
      errors.add(:release_year, "We aren't even in that year!")
    end
  end

  def same_artist_name_same_year
    if self.title && self.release_year
      if Song.all.find_by(title: self.title, release_year: self.release_year)
        errors.add(:title, "This song has already been given the same year")
      end
    end
  end

end

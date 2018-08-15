class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :is_released?
  validates :release_year, numericality: {less_than: 2018}, allow_nil: true
  validate :same_title_by_artist_in_same_year

  def is_released?
    self.released == true
  end

    def not_released?
      self.released == false
    end

    def same_title_by_artist_in_same_year
      if self.title && self.release_year
        if Song.all.find_by(title: self.title, release_year: self.release_year)
          errors.add(:title, "can't be repeated in the same year by the same artist")
        end
      end
    end
end

class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false]}
    validate :release_year_released
    validate :release_year_in_the_future
    validate :same_song_same_year

    def release_year_released
        if self.released == true && self.release_year == nil
            errors.add(:release_year, "Must have release year if released.")
        end
    end

    def release_year_in_the_future
        if self.release_year && self.release_year > Date.today.year
            errors.add(:release_year, "Release year is in the future.")
        end
    end

    def same_song_same_year
        if self.title && self.release_year
            if Song.all.find_by(title: self.title, release_year: self.release_year)
                errors.add(:release_year, "A song with the same name has already been released this year.")
            end
        end
    end


end

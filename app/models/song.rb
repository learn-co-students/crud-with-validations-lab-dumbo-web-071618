class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]} #dont need presence for boolean
  validate :year?

  def year?
    if released == true && release_year == nil
      errors.add(:release_year, "Please enter a year")
    elsif released == true && release_year > Time.now.year
      errors.add(:release_year, "Date must be less than or equal to the current year")
    end
  end
  
end

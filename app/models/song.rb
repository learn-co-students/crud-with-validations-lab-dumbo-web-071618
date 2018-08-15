class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?
    def released?
      released == true
    end
  # validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  validates :artist_name, presence: true
end

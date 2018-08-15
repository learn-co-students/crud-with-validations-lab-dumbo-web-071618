class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  validates :released, inclusion: { in: [true, false] }

  validates :release_year, presence: true, if: :released?

  validates :release_year, numericality: { less_than_or_equal_to: 2018 }, allow_nil: true

  validates :artist_name, presence: true



end

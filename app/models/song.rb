# require_relative '../validators/song_validator.rb'

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with SongValidator

  validates :title, presence: true
  validates :title, uniqueness: true
  # validates :released, inclusion: {in: %w(true false), message: "Must be true or false"}
  validates :artist_name, presence: true
end

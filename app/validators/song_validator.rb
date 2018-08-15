class SongValidator < ActiveModel::Validator

  def validate record
    if record.released && record.release_year.nil?
      record.errors.add :release_year, "Must have a release year if song was released"
    end

    if record.released && !record.release_year.nil? && record.release_year > DateTime.now.year
      record.errors.add :release_year, "Must have a valid release year"
    end
  end
end

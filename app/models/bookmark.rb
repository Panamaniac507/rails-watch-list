class Bookmark < ApplicationRecord
  belongs_to :list, dependent: :destroy
  belongs_to :movie, dependent: :destroy
  validates
end


# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.

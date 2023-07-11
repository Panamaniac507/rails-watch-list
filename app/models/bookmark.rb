class Bookmark < ApplicationRecord
  belongs_to :list, dependent: :destroy
  belongs_to :movie, dependent: :destroy
  validates :movie_id, uniqueness: { scope: :list_id, message: "Already on the list"}
  validates :comment, length: { minimum: 6 }
end


# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.

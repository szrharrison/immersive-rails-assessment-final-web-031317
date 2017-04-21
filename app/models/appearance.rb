class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :user, optional: true

  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6, message: "must be between 1 and 5" }
  validates :user, presence: { message: "must be logged in" }

end

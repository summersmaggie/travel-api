class Review < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :content
  validates_presence_of :destination

  scope :search_destination, -> (destination) { where("destination like ?", "%#{destination}%")}

  scope :search_author, -> (author) { where("author like ?", "%#{author}%")}

  scope :search_most_popular, -> {(
    select("reviews.destination, count(reviews.id) as reviews_count")
    .group("reviews.destination")
    .order("reviews_count DESC")
    .limit(1)
    )}
end

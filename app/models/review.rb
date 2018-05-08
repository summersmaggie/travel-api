class Review < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :content
  validates_presence_of :destination

  scope :search_destination, -> (destination) { where("destination like ?", "%#{destination}%")}

  scope :search_author, -> (author) { where("author like ?", "%#{author}%")}
end

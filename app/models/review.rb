class Review < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :content
  validates_presence_of :destination
end

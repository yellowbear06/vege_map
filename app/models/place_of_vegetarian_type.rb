class PlaceOfVegetarianType < ApplicationRecord
  belongs_to :place
  belongs_to :vegetarian_type

  validates :place_id, uniqueness: true, presence: true
  validates :vegetarian_type_id, presence: true

  enum option: { entirely: 0, partly: 1 }
end

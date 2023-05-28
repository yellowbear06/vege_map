class PlaceOfVegetarianType < ApplicationRecord
  belongs_to :place
  belongs_to :vegetarian_type

  enum option: { entirely: 0, partly: 1 }
end

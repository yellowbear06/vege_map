class UserList < ApplicationRecord
  belongs_to :user
  has_many :list_places
  has_many :listing_places, through: :list_places, source: :place

  validates :list_name, presence: true, length: { maximum: 15 }

  def add_list(place)
    listing_places << place
  end

  def unlist(place)
    listing_places.destroy(place)
  end
end

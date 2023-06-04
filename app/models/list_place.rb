class ListPlace < ApplicationRecord
  belongs_to :user_list
  belongs_to :place

  validates :user_list_id, uniqueness: { scope: :place_id }
end

class UserList < ApplicationRecord
  belongs_to :user
  has_many :list_places

  validates :list_name, presence: true, length: { maximum: 15 }
end

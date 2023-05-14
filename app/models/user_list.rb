class UserList < ApplicationRecord
  belongs_to :user
  has_many :list_places
end

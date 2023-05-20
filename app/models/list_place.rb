class ListPlace < ApplicationRecord
  belongs_to :user_list
  belongs_to :place
end

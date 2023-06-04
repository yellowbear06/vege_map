class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  authenticates_with_sorcery!
  has_many :user_lists
  has_many :events
  belongs_to :vegetarian_type
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, uniqueness: true, presence: true
  validates :role, presence:true
  enum role: { general: 0, admin: 1 }

  def create_default_lists
    self.user_lists.create(list_name:"お気に入り")
    self.user_lists.create(list_name:"行ってみたい")
    self.user_lists.create(list_name:"行ったよ")
  end
end
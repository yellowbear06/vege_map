class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, uniqueness: true, presence: true
  enum role: { general: 0, admin: 1 }
end
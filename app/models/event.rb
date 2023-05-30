class Event < ApplicationRecord
  belongs_to :user
  belongs_to :place, optional: true

  validates :name, presence: true, length: { maximum: 30 }
  validates :user_id, presence: true
  validates :start_time, presence: true
  validates :status, presence: true
  validate :start_time_before_end_time
  enum status: { draft_event: 0, private_event: 1, public_event: 2, private_done: 3, public_done: 4 }

  def start_time_before_end_time
    if start_time > end_time
      errors.add(:start_time, "は終了時刻より前にしてください")
    end
  end
end
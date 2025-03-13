class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }


  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :invitations
  has_many :attendees, through: :invitations, source: :attendee

  validates :creator_id, presence: true
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
end

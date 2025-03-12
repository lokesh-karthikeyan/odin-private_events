class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :invitations
  has_many :attendees, through: :invitations

  validates :creator_id, presence: true
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
end

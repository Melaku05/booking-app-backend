class Doctor < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy
  validates :name, presence: true, length: { in: 0..50 }
  validates :detail, presence: true, length: { in: 0..500 }
  validates :photo, presence: true, length: { in: 0..240 }
  validates :city, presence: true, length: { in: 0..50 }
  validates :specialization, presence: true, length: { in: 0..100 }
  validates :fee, presence: true, numericality: { greater_than: 0 }
end

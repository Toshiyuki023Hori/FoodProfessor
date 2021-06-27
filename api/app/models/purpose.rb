class Purpose < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :processes

  validates :user_id, presence: true
  validates :purpose_name, { presence: true, length: { maximum: 50 } }
  validates :purpose_content, length: { maximum: 200 }
  validates :purpose_for_people, numericality: { greater_than: 0, only_integer: true }
  validates :purpose_time, numericality: { greater_than: 0, only_integer: true }
end

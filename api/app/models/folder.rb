class Folder < ApplicationRecord
  belongs_to :user
  has_many :recipes

  validates :folder_name, { presence: true, length: { maximum: 50 } }
end

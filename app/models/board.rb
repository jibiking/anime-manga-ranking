class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :board_image

  mount_uploader :board_image, BoardImageUploader

  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 500}
end

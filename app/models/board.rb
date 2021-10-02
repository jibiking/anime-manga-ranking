class Board < ApplicationRecord
  belongs_to :user
  mount_uploader :board_image, BoardImageUploader

  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 500}
end

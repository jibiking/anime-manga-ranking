class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_boards, through: :likes, source: :board

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, uniqueness: true

  # objectに渡されたものがuserのものであるか？
  def own?(object)
    id == object.user_id
  end

  # boardに渡されたboardがlikeされているか？
  def like?(board)
    like_boards.include?(board)
  end

  # boardをlikeに追加
  def like(board)
    like_boards << board
  end

  # boardからlikeを削除
  def unlike(board)
    like_boards.destroy(board)
  end
end

class AddBoardImageToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :board_image, :string
  end
end

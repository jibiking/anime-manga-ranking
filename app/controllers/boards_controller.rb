class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to(:boards, success: '作品を追加しました！ありがとうございます！')
    else
      flash.now[:danger] = '作品を追加できませんでした…。'
      render 'new'
    end
  end

  def show
    @comment = current_user.comments.build
    @comment.board_id = @board.id
    @comments = Comment.all.order(created_at: 'DESC')
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to(:boards, success: '作品を修正しました！ありがとうございます！')
    else
      flash.now[:danger] = '作品を追加できませんでした…。'
      render 'edit'
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, success: '作品を削除しました！'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :board_image)
  end
end

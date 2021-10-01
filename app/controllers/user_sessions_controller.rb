class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:name], params[:password])

    if @user
      redirect_back_or_to(:users, success: 'ログインしました。')
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, success: 'ログアウトしました。')
  end
end

class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to :users
    else
      flash.now[:alart] = '로그인 실패'
      puts "#{@user}  #{params}"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to :users, notice: '로그아웃'
  end
end

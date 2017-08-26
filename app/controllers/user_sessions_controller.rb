class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:name], params[:password])
      redirect_back_or_to root_path
    else
      flash.now[:alart] = '로그인 실패'
      puts "#{@user}  #{params}"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to :login, notice: '로그아웃'
  end
end

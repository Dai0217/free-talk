class UserController < ApplicationController
  def index
  end

  def create
    @user=User.new
  end

  def new
    @user=User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_name]=@user.name
      session[:user_id]=@user.id
      redirect_to("/post/top")
    else
      redirect_to("/user/create")
    end
  end

  def confirm
    @user=User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_name]=@user.name
      session[:user_id]=@user.id
      redirect_to("/post/top")
    else
      @error_message="メールアドレスまたはパスワードが間違っています"
      @email=params[:email]
      @password=params[:password]
      render("/user/index")
    end
  end

  def logout
    session[:user_name]=nil
    session[:user_id]=nil
    render("/user/index")
  end

  def edit
    @user=User.find_by(id: session[:user_id])
  end

  def change
    @user=User.find_by(id: params[:id])
    @user.name=params[:name]
    @user.save
    if @room=Post.find_by(user_id: session[:user_id])
      @room.name_id=params[:name]
      @room.save
      session[:user_name]=@user.name
      redirect_to("/post/top")
    else
      session[:user_name]=@user.name
      redirect_to("/post/top")
    end
  end
end

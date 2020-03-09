class PostController < ApplicationController
  def top
    @rooms=Post.all.order(created_at:"desc")
  end

  def creat
    @user=User.find_by(id: session[:user_id])
  end

  def new
    unless @room=Post.find_by(user_id: session[:user_id])
      @room=Post.new(room: params[:room], name_id: session[:user_name], user_id: session[:user_id])
      @room.save
      redirect_to("/room/#{@room.id}/top")
    else
      flash[:notice]="部屋は一人につき一つまでです"
      redirect_to("/post/top")
    end
  end

  def exit
    redirect_to("/post/top")
  end
end

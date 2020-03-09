class RoomController < ApplicationController
  def top
    @room=Post.find_by(id: params[:id])
    @chats=Chat.where(room_id: params[:id]).order(created_at:"desc")
  end

  def create
    @chats=Chat.new(name: session[:user_name], room_id: params[:id], content: params[:content])
    @chats.save
    redirect_to("/room/#{params[:id]}/top")
  end

  def search
    @rooms=Post.where(room: params[:name])
    render("/post/top")
  end

  def destroy
    @chat=Chat.where(room_id: params[:id])
    @chat.destroy_all
    @room=Post.find_by(id: params[:id])
    @room.destroy
    redirect_to("/post/top")
  end
end

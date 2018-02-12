class LikesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, comment_id: params[:comment_id])
    @likes = Like.where(comment_id: params[:comment_id])
    @comment = Comment.find(params[:comment_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Like.find_by(comment_id: params[:comment_id], user_id: current_user.id).destroy
    @likes = Like.where(comment_id: params[:comment_id])
    @comment = Comment.find(params[:comment_id])
    respond_to do |format|
      format.js
    end
  end

end

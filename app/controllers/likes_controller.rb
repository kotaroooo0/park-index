class LikesController < ApplicationController

  def create
    Like.new(like_params).save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    Like.find_by(like_params).destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def like_params
    params.permit(:user_id, :comment_id)
  end

end

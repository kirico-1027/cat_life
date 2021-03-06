class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    comment = Comment.find(params[:comment_id])
    current_user.favorite(comment)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    current_user.unfavorite(comment)
    redirect_back(fallback_location: root_path)
  end
end

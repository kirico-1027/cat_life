class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @comment = current_user.comments.build
    @item = Item.find(params[:item_id])
  end

  def show
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = current_user.comments.build(comment_params)
    @comment.item_id = @item.id
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to item_path(@item)
    else
      @comments = current_user.comments.order(id: :desc)
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render 'comments/new'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :item_id, :title, :content)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
  end
end

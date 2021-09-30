class ItemsController < ApplicationController
 before_action :require_user_logged_in
  
  def show
    @item = Item.find(params[:id])
    @pagy, @comments = pagy(@item.comments.order(created_at: :desc), items: 3)
  end
end

class ItemsController < ApplicationController
  def index
      @items = Item.where(user_id: params[:user_id])
      authorize @items
      @item = Item.new
      authorize @item

  end

  def new
      @item = Item.new
      authorize @item
  end

  def create
      @item = Item.new(item_params)
      @item.user_id = current_user.id
      @user = User.find(current_user.id)
      @new_item = Item.new
      authorize @item
      if !@item.save
        flash.now[:alert] = "There was an error saving the item. Please try again."
        #render :new
      end

  end

  def destroy
      @item = Item.find(params[:id])
      authorize @item
      if !@item.destroy
        flash.now[:alert] = "There was an error deleting the item."
        redirect_to user_items_path
      end
  end

    respond_to do |format|
         format.html
         format.js
    end

  private

    def item_params
      params.require(:item).permit(:name, :user_id)
    end

end

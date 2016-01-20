class ItemsController < ApplicationController
  def show
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
      authorize @item
      if @item.save
        redirect_to show_items_path #, notice: "Item was saved successfully."
      else
        flash.now[:alert] = "There was an error saving the item. Please try again."
        render :new
      end

  end

  def destroy
      @item = Item.find(params[:id])
      authorize @item
      if @item.destroy
        redirect_to show_items_path
      else
        flash.now[:alert] = "There was an error deleting the item."
        redirect_to show_items_path
      end
  end

  private

    def item_params
      params.require(:item).permit(:name, :user_id)
    end

end

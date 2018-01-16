class ItemsController < ApplicationController
  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to current_user
    else
      flash[:alert] = @item.errors.full_messages.join(". ")
      redirect_to current_user
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
      redirect_to current_user
    else
      flash.now[:alert] = "There was an error deleting the item."
      render :show
    end
  end

  private

    def item_params
      params.require(:item).permit(:name)
    end
end

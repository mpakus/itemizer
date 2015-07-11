class Api::V1::ItemsController < Api::V1::ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :item_not_found
  before_action :set_item, only: [:destroy, :show, :update]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    else
      item_errors(item)
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      item_errors(@item)
    end
  end

  def destroy
    @item.destroy
    render json: { msg: 'ok' }
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :picture)
  end

  def item_not_found
    render json: { error: 'item not found' }, status: 404
    false
  end

  def item_errors(item)
    render json: { errors: item.errors }, status: 400
  end
end

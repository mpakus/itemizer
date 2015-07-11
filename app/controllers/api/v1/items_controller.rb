class Api::V1::ItemsController < Api::V1::ApplicationController

  def index
    render json: Item.all
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end
end
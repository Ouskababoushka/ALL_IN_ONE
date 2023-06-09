class ResultItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @result_items = ResultItem.all
  end

  def show
    @result_item = ResultItem.find(params[:id])
  end

  def new
    @result_item = ResultItem.new
  end

  def create
    @result_item = ResultItem.new(result_item_params)

    if @result_item.save
      redirect_to @result_item
    else
      render :new
    end
  end

  def edit
    @result_item = ResultItem.find(params[:id])
  end

  def update
    @result_item = ResultItem.find(params[:id])

    if @result_item.update(result_item_params)
      redirect_to @result_item
    else
      render :edit
    end
  end

  def destroy
    @result_item = ResultItem.find(params[:id])
    @result_item.destroy

    redirect_to result_items_path
  end

  private

  def result_item_params
    params.require(:result_item).permit(:title, :description, :price, :image_url, :item_type,
                                        :posted_at, :city, :currency, :hosted_url, :hosted_website)
  end
end

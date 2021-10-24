# frozen-string-literal: true

# Lista all, create a new and show individual list.
class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    name = list_params['name'].split(/ |_/).map(&:capitalize).join(' ')
    @list = List.new({ name: name, image_url: list_params['image_url'] })
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def show; end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :image_url)
  end
end

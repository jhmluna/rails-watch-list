# frozen-string-literal: true

# Lista all, create a new and show individual list.
class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    name = list_params['name'].split(/ |_/).map(&:capitalize).join(' ')
    @list = List.new({ name: name })
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

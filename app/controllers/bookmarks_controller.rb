class BookmarksController < ApplicationController
  before_action :find_list
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :new
    end
  end

  private

  def find_list
    # in our routes for bookmark it is :list_id
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

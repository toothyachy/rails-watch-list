class BookmarksController < ApplicationController
  before_action :set_list_bookmark, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
    # comment=params[:bookmark][:comment]
    # movie_id=params[:bookmark][:movie_id]
    # list_id=params[:list_id]
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list_bookmark
    @list = List.find(params[:list_id])
  end
end

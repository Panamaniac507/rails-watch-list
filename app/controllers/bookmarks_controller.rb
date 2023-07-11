class BookmarksController < ApplicationController

  # before_action :set_bookmark, only: [:new, :create]


  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movies = @movie
    @bookmark.lists = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to bookmark_path(@bookmark.lists), status: :see_other
  end

  private

  # def set_bookmark
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end

class BookmarksController < ApplicationController

  before_action :set_bookmark, only: [:new, :create]


  def new
    @bookmark = Bookmark.new
  end


  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movies = @movie
    @bookmark.lists = @list
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
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

  def set_bookmark
    @bookmark = Bookmark.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:name)
  end

end

class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :destroy]
  #before_action :authenticate_user!, :except => [:index, :show]

  
  def create
    
    @bookmark = current_user.bookmarks.build(bookmark_params)
    #@user = current_user
    #@bookmark = @user.bookmarks.new(bookmark_params)
      if @bookmark.save
        @clothing = @bookmark.clothing
        respond_to :js
      else
        flash[:alert] = "Something went wrong ..."
      end
    end


  # PATCH/PUT /clothings/1

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @clothing = @bookmark.clothing
    if @bookmark.destroy

        respond_to :js
      else
        flash[:alert] = "Something went wrong ..."

    end
  end

  

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.permit :user_id, :clothing_id 
    end
end

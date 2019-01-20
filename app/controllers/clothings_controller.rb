class ClothingsController < ApplicationController
  before_action :set_clothing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  # GET /clothings
  # GET /clothings.json
  def index
  
  if params[:tag]
    @clothings = Clothing.tagged_with(params[:tag])
  else
    @clothings = Clothing.all
  end


  end

  # GET /clothings/1
  # GET /clothings/1.json
  def show
    @clothing_clothingimages = @clothing.clothingimages
    @is_bookmarked = @clothing.is_bookmarked(current_user)
  end

  # GET /clothings/new
  def new
    @clothing = Clothing.new
    @tag = Tag.new
    @ws = W.all.map{|c| [ c.name, c.id, c.parent_id ] }
    @ws = Category.all.map{|c| [ c.name, c.id, c.parent_id ] }
  end

  # GET /clothings/1/edit
  def edit
    @clothing = Clothing.friendly.find(params[:id])
  end

  # POST /clothings
  # POST /clothings.json
  def create
    
        #@clothing = current_profile.clothings.build(clothing_params)
    @user = current_user
    @clothing = @user.clothings.new(clothing_params)

    respond_to do |format|
      if @clothing.save
        format.html { redirect_to @clothing, notice: 'Clothing was successfully created.' }
        format.json { render :show, status: :created, location: @clothing }
      else
        format.html { render :new }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothings/1
  # PATCH/PUT /clothings/1.json
  def update
     @clothing = Clothing.friendly.find(params[:id])

    if @clothing.listing_token.blank?
       @clothing.regenerate_listing_token
     end

    respond_to do |format|
      if @clothing.update(clothing_params)
        format.html { redirect_to @clothing, notice: 'Clothing was successfully updated.' }
        format.json { render :show, status: :ok, location: @clothing }
      else
        format.html { render :edit }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /clothings/1
  # DELETE /clothings/1.json
  def destroy
    @clothing.destroy
    respond_to do |format|
      format.html { redirect_to clothings_url, notice: 'Clothing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tagged
  if params[:tag].present?
    @clothings = Clothing.tagged_with(params[:tag])
  else
    @clothings = Clothing.all
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clothing_params
      params.require(:clothing).permit(:name, :overview, :price, :video_link, :listing_token, :stock,
       :website_url, :longitude, :latitude, :w_id, :fashion_id, :local_area, :area_code, :town, :country, :currency, 
        :clothingimages_cache, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :slug, {clothingimages: []} )
    end
end

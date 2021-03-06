class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show] 
 

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
    
  end

  #def index

  #if params[:tag]

  #@tags = Tag.order("created_at desc").tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 20)

  
  #else

  #tags = Tag.order("created_at desc").paginate(:page => params[:page], :per_page => 20)

  #respond_to do |format|
      #format.html
      #format.js # add this line for your js template
    #end
    #end

 
  #end


  # GET /tags/1
  # GET /tags/1.json
  def show
    @tags = Tag.find(params[:id])
    @tags = Tags.all # list all echocategories on echocategory page
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json



  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: {errors: @tag.errors.full_messages}
    end
end




    #def create
      #@tag = Tag.new(tag_params)

      #respond_to do |format|
        #if @tag.save
          #format.html { redirect_to :back, notice: 'Tag was successfully created.' }
          #format.json { render :show, status: :created, location: @tag }
        #else
          #format.html { render :new }
          #format.json { render json: @tag.errors, status: :unprocessable_entity }
        #end
      #end
    #end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_path, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Redirect to previous page after sign in

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :tag_id, :id)
    end
end

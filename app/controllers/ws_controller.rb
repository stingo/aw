class WsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_w, only: [:show, :edit, :update, :destroy]

  # GET /ws
  # GET /ws.json
  def index
    @ws = W.all
  end

  # GET /ws/1
  # GET /ws/1.json
  def show
    @w = W.friendly.find(params[:id])
    @ws = W.all # list all echocategories on echocategory page
  end

  # GET /ws/new
  def new
    @w = W.new


  end

  # GET /ws/1/edit
  def edit
    @w = W.friendly.find(params[:id])
  end

  # POST /ws
  # POST /ws.json
  def create
    @w = current_user.ws.build(w_params)

    respond_to do |format|
      if @w.save
        format.html { redirect_to @w, notice: 'W was successfully created.' }
        format.json { render :show, status: :created, location: @w }
      else
        format.html { render :new }
        format.json { render json: @w.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ws/1
  # PATCH/PUT /ws/1.json
  def update
    @w = W.friendly.find(params[:id])
    respond_to do |format|
      if @w.update(w_params)
        format.html { redirect_to @w, notice: 'W was successfully updated.' }
        format.json { render :show, status: :ok, location: @w }
      else
        format.html { render :edit }
        format.json { render json: @w.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ws/1
  # DELETE /ws/1.json
  def destroy
    @w.destroy
    respond_to do |format|
      format.html { redirect_to ws_url, notice: 'W was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_w
    @w = W.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def w_params
      params.require(:w).permit(:name, :slug, :description, :ancestry )
    end
end

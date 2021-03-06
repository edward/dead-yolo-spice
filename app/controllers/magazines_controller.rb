class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]

  
  # GET /magazines
  # GET /magazines.json
  def index
    @magazines = Magazine.all
  end

  # GET /magazines/1
  # GET /magazines/1.json
  
  def show
    @magazine = Magazine.find(params[:id])
  end

  

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end

  # GET /magazines/1/edit
  def edit
  end

  # POST /magazines
  # POST /magazines.json
  def create
    @magazine = Magazine.new(magazine_params)

    respond_to do |format|
      if @magazine.save
        format.html { redirect_to @magazine, notice: 'Magazine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @magazine }
      else
        format.html { render action: 'new' }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazines/1
  # PATCH/PUT /magazines/1.json
  def update
    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to @magazine, notice: 'Magazine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.json
  def destroy
    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to magazines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:status, :title, :start_date, :end_date, :payment, :magazineformat, :submissionrestriction, :genre, :publicationcycle, :submissionlimit, :address_number, :street_name, :city_name, :province_name, :country_name)
    end
end

class WebsController < ApplicationController
  before_action :set_web, only: [:show, :edit, :update, :destroy]

  # GET /webs
  # GET /webs.json
  
  def chart
    respond_to do |format|
      format.html
    end
  end
  def search
    @search = Web.all    
  end

  def index
    @webs = Web.all
    #@webs = Web.order(:created).page params[:page]
  end

  # GET /webs/1
  # GET /webs/1.json
  def show
  end

  # GET /webs/new
  def new
    @web = Web.new
  end

  # GET /webs/1/edit
  def edit
  end

  # POST /webs
  # POST /webs.json
  def create

    @web = Web.new(web_params)

    respond_to do |format|
      if @web.save
        format.html { redirect_to @web, notice: 'Web was successfully created.' }
        format.json { render action: 'show', status: :created, location: @web }
      else
        format.html { render action: 'new' }
        format.json { render json: @web.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webs/1
  # PATCH/PUT /webs/1.json
  def update
    respond_to do |format|
      if @web.update(web_params)
        format.html { redirect_to @web, notice: 'Web was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webs/1
  # DELETE /webs/1.json
  def destroy
    @web.destroy
    respond_to do |format|
      format.html { redirect_to webs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web
      @web = Web.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_params
      params.require(:web).permit(:name, :url, :html, :facebook, :twitter, :hatena, :deleted_at)
    end
end

class ScrapingWebsController < ApplicationController
  before_action :set_scraping_web, only: [:show, :edit, :update, :destroy]

  # GET /scraping_webs
  # GET /scraping_webs.json
  def index
    @scraping_webs = ScrapingWeb.all
  end

  # GET /scraping_webs/1
  # GET /scraping_webs/1.json
  def show
  end

  # GET /scraping_webs/new
  def new
    @scraping_web = ScrapingWeb.new
  end

  # GET /scraping_webs/1/edit
  def edit
  end

  # POST /scraping_webs
  # POST /scraping_webs.json
  def create
    @scraping_web = ScrapingWeb.new(scraping_web_params)

    respond_to do |format|
      if @scraping_web.save
        format.html { redirect_to @scraping_web, notice: 'Scraping web was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scraping_web }
      else
        format.html { render action: 'new' }
        format.json { render json: @scraping_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraping_webs/1
  # PATCH/PUT /scraping_webs/1.json
  def update
    respond_to do |format|
      if @scraping_web.update(scraping_web_params)
        format.html { redirect_to @scraping_web, notice: 'Scraping web was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scraping_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraping_webs/1
  # DELETE /scraping_webs/1.json
  def destroy
    @scraping_web.destroy
    respond_to do |format|
      format.html { redirect_to scraping_webs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_web
      @scraping_web = ScrapingWeb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraping_web_params
      params.require(:scraping_web).permit(:name, :url, :html, :facebook, :twitter, :hatena, :deleted_at, :timing)
    end
end

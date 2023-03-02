class ArticlesController < ApplicationController
  before_action :get_colors, only: %i[ edit update new create]
  before_action :get_models, only: %i[ edit update new create]
  before_action :set_article, only: %i[ show edit update destroy ]
  #before_action :get_code, only: %i[ show ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    #@article = Article.new(article_params)
    
    #@article[:cod]= get_code

    respond_to do |format|
      if save_articles
        format.html { redirect_to articles_url, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:num, :stock, :price, :model_id, :color_id, :cod)
    end

    def get_models
      @model_options = Model.all.map {|model| ["#{model.brand.name}-#{model.name}", model.id]}
    end

  

    def get_colors
      @colors = {}
      Color.all.each do |color|
        @colors["#{color.name}"] = color.id
      end
    end


    def save_articles
      puts "params #{params[:article]}"
      from = params[:article][:from]
      to = params[:article][:to]
      range = Range.new(from.to_i,to.to_i)
      puts "range #{range}"
      #partial_code = get_code
      ok = true
      range.each do |num|
        @article = Article.new(article_params)
        #@article[:cod]= partial_code + num.to_s
        @article[:num] = num
        if !@article.save
          ok=false       
        end 
      end
      ok
    end
end

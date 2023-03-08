class ArticlesController < ApplicationController
  before_action :get_colors, only: %i[ new create copy save_copy]
  before_action :get_models, only: %i[ new create]
  before_action :set_article, only: %i[ show edit update destroy copy save_copy ]

  # GET /articles or /articles.json
  def index
    #@articles = Article.all.ordered
    @articles = Article.ordered
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
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
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

  def copy
  end

  def save_copy
    puts "from #{params[:from]}"
    puts "to #{params[:to]}"
    puts "article #{@article}"
    respond_to do |format|
      if save_articles
        format.html { redirect_to articles_url, notice: "Articles were successfully copied." }
        format.json { render :show, status: :created, location: @article }
      end
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:stock, :price, :model_id, :color_id, :cod, :num)
    end

    def get_models
      @models = Model.all
    end
  

    def get_colors
      @colors = Color.all
    end

    def save_articles
      from = params[:from]
      to = params[:to]
      color_id = params[:color]
      color = Color.find(color_id)
      range = Range.new(from.to_i,to.to_i)
      ok = true
      array_to_save = []
      
      range.each do |num|
        if !@article.exists?(num, color)
          article_to_save = {
            "stock"=>@article.stock,
            "price"=>@article.price,
            "model"=>@article.model,
            "num" =>  num, 
            "color" => color
          }
          array_to_save.push(article_to_save)
        end
      end
      array_to_save.each do |elem|
        Article.create(elem)
      end
      ok
    end
end

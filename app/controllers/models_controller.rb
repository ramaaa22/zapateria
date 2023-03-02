class ModelsController < ApplicationController
  before_action :get_brand, only: %i[ create ]
  before_action :get_brands, only: %i[ edit update new create ]
  before_action :get_categories, only: %i[ edit update new create]
  before_action :set_model, only: %i[ show edit update destroy ]

  # GET /models or /models.json
  def index
    @models = Model.all
  end

  # GET /models/1 or /models/1.json
  def show
    @articles = @model.articles
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models or /models.json
  def create
    @model = Model.new(model_params)  
    if exists_cod?
      return
    end
    respond_to do |format|
      if @model.save
        format.html { redirect_to model_url(@model), notice: "Model was successfully created." }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1 or /models/1.json
  def update
    if exists_cod?
      return
    end

    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to model_url(@model), notice: "Model was successfully updated." }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1 or /models/1.json
  def destroy
    @model.destroy

    respond_to do |format|
      format.html { redirect_to models_url, notice: "Model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:model).permit(:name, :cod, :brand_id, :category_id)
    end

    def get_brand
      brand_id = params[:model][:brand_id]
      @brand = Brand.find(brand_id)
    end

    def exists_cod?
      code_to_find = model_params[:cod]
      found = Model.find_by cod: code_to_find
      if (found)
        return found.brand_id == @brand.id
      end
      return false
    end

    def get_brands
      @brands = {}
      Brand.active.all.each do |brand|
        @brands["#{brand.name}"]= brand.id
      end
    end

    def get_categories
      @categories = {}
      Category.all.each do |category|
        @categories["#{category.name}"] = category.id
      end
    end
end

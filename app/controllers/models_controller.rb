class ModelsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_brands, only: %i[ edit update new create ]
  before_action :get_categories, only: %i[ edit update new create]
  before_action :set_model, only: %i[ show edit update destroy ]

  # GET /models or /models.json
  def index
    @models = Model.ordered
  end

  # GET /models/1 or /models/1.json
  def show
    @articles = @model.articles.ordered
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

    respond_to do |format|
      if @model.save
        format.html { redirect_to models_path, notice: "Model was successfully created." }
        format.json { render :index, status: :created, location: @model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1 or /models/1.json
  def update
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
    respond_to do |format|
      if @model.destroy
        format.html { redirect_to models_url, notice: "Model was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
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

    def get_brands
      @brands = Brand.all
    end

    def get_categories
      @categories = Category.all
    end
end

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts/1 or /carts/1.json
  def show
  end


  def destroy
    respond_to do |format|
      if  @cart.destroy
        format.html { redirect_to store_index_path, notice: "Cart was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      #@cart = Cart.find(params[:id])
      @cart = Cart.find_by("user_id"=> current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart 
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid cart'
    end
end

class StoreController < ApplicationController
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart
  def index
    @models = Model.with_articles
  end

  def show
    @model = Model.find(params[:id])
    @articles = @model.articles.ordered.active
    @articles = @articles.group_by { |article| article.color_id}
  end

end

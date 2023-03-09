class StoreController < ApplicationController
  def index
    @models = Model.with_articles
  end

  def show
    @model = Model.find(params[:id])
    @articles = @model.articles.ordered.active
  end

end

class GgArticlesController < ApplicationController
  unloadable

  # menu_item :config_gestion_garantias 
  # before_filter :find_project_by_project_id, :authorize

  # def index
  # 	@articles = GgArticle.all
  # end

  # def show
  # 	@article = GgArticle.find params[:id]
  # 	@contacts = @article.gg_contacts.order("level ASC")
  # end

end

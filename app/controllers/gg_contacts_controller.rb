class GgContactsController < ApplicationController
  unloadable

  menu_item :config_gestion_garantias 
  before_filter :find_project_by_project_id, :authorize

  before_filter :set_file, only: [:index, :new, :create, :destroy]
  before_filter :set_article, only: [:index, :new, :create, :destroy]
  def index

  end

  private
  def set_article
    @article = GgArticle.find params[:gg_article_id]
  end

  def set_file
    @file = GgFile.find params[:gg_file_id]
  end

end

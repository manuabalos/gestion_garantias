class GgArticlesController < ApplicationController
  unloadable

  menu_item :config_gestion_garantias 
  before_filter :find_project_by_project_id, :authorize

  before_filter :set_article, only: [:edit, :update, :destroy]
  before_filter :set_file, only: [:index, :new, :create, :destroy]

  def index
    @articles = @file.gg_articles.order("code_article ASC")
  end

  def new
    @article = GgArticle.new
  end

  def create
    @article = GgArticle.new params["gg_article"]

    if @article.save
      flash[:notice] = l(:"article.notice_create")
      redirect_to  project_gg_file_gg_articles_path(@file, :project_id => @project)
    else
      flash[:error] = @article.get_error_message
      redirect_to action: 'new', :project_id => @project
    end
  end

  def edit
    
  end

  def update 
    if @article.update_attributes(params[:gg_file]) 
      flash[:notice] = l(:"article.notice_edit")
      redirect_to project_gg_home_path(:project_id => @project.id)
    else
      flash[:error] = @article.get_error_message
      redirect_to action: 'edit', :project_id => @project.id
    end
  end

  def destroy
    # FALTA COMPROBAR QUE ELIMINA LAS RELACIONES:
    #       > ARTICULOS - CONTACTOS 

    if @article.destroy
      flash[:notice] = l(:"article.notice_destroy")
    else
      flash[:error] = l(:"article.error.action_destroy")
    end

    redirect_to project_gg_file_gg_articles_path(@file, :project_id => @project)
  end

  private
  def set_article
    @article = GgArticle.find params[:id]
  end

  def set_file
    @file = GgFile.find params[:gg_file_id]
  end

end

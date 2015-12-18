class GgFilesController < ApplicationController
  unloadable

  menu_item :config_gestion_garantias 
  before_filter :find_project_by_project_id, :authorize

  before_filter :set_file, only: [:edit, :update, :destroy]

  def index
  	@files = GgFile.all
  end

  def new
  	@file = GgFile.new
  end

  def create
  	@file = GgFile.new(params["gg_file"])

  	if @file.save
      flash[:notice] = l(:"file.notice_create")
  	  redirect_to project_gg_home_path(:project_id => @project)
    else
      flash[:error] = @file.get_error_message
      redirect_to action: 'new', :project_id => @project
    end
  end

  def edit
    
  end

   def update 
      if @file.update_attributes(params[:gg_file]) 
        flash[:notice] = l(:"file.notice_edit")
        redirect_to project_gg_home_path(:project_id => @project.id)
      else
        flash[:error] = @file.get_error_message
        redirect_to action: 'edit', :project_id => @project.id
      end
    end

  def destroy
    # FALTA COMPROBAR QUE ELIMINA LAS RELACIONES:
    #       > ARTICULOS - CONTACTOS 
    #       > EXPEDIENTE - ARTICULOS
    
    if @file.destroy
      flash[:notice] = l(:"file.notice_destroy")
    else
      flash[:error] = l(:"file.error.action_destroy")
    end

    redirect_to project_gg_home_path(:project_id => @project.id)
  end

  def set_file
    @file = GgFile.find(params[:id]) 
  end
end

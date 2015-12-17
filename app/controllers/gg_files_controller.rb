class GgFilesController < ApplicationController
  unloadable

  menu_item :config_gestion_garantias 
  before_filter :find_project_by_project_id, :authorize

  def index
  	@files = GgFile.all
  end

  def new
  	@file = GgFile.new
  end

end

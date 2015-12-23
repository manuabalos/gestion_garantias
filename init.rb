require 'gg/application_helper_patch'

Redmine::Plugin.register :gestion_garantias do
  name 'Redmine Gestion Garantias'
  author 'mabalos'
  description 'Permite almacenar los datos de los servicios tecnicos en cada expediente adjudicado por la Agencia de Educacion.'
  version '0.0.1'
  author_url 'http://www.emergya.es'

 project_module :gestion_garantias do
    permission :gg_edit_files, :gg_files => [:index, :new, :create, :edit, :update, :destroy]
    permission :gg_edit_articles, :gg_articles => [:new, :create, :edit, :update, :destroy]
 end
 
 menu :project_menu, :config_gestion_garantias, { :controller => 'gg_files', :action => 'index' }, :caption => 'Gestion de garantias', :last => true, :param => :project_id
end

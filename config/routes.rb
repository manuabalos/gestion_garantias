# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do
	scope '/projects/:project_id/', :as => "project" do
		
		match 'gestion_garantias', to: 'gg_files#index', as: 'gg_home'

		resources :gg_files, :controller => 'gg_files', :as => 'gg_files' do
			resources :gg_articles, :controller => 'gg_articles', :as => 'gg_articles' do
				resources :gg_contacts
			end
		end
	end
end
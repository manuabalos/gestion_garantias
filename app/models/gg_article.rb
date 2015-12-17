class GgArticle < ActiveRecord::Base
  unloadable
  
  belongs_to :gg_file
  has_many :gg_contacts
end

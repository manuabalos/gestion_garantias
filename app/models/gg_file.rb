class GgFile < ActiveRecord::Base
  unloadable
  
  has_many :gg_articles
end

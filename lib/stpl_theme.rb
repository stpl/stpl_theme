# StplTheme
require "stpl_theme/stpl_themed_user" 
require "app/models/stpl_theme" 
require "yml_loader"
require 'app/helpers/stpl_theme_helper'

%w{ models controllers helpers}.each do |dir| 
  path = File.join(File.dirname(__FILE__), 'app', dir)  
  $LOAD_PATH << path 
  ActiveSupport::Dependencies.load_paths << path 
  ActiveSupport::Dependencies.load_once_paths.delete(path) 
end 

#Showing views
ActionController::Base.class_eval do
  append_view_path File.join(File.dirname(__FILE__), 'app', 'views')
end
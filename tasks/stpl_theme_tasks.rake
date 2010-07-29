namespace :stpl_theme do
  desc "create the yml files to config directory and assets in public directory "
  task :init do
    FileUtils.copy(File.dirname(__FILE__) + "/../lib/stpl_theme.yml",RAILS_ROOT + "/config/")
    FileUtils.copy_entry(File.dirname(__FILE__) + "/../public/stpl_theme/",RAILS_ROOT + "/public/stpl_theme")
  end
end 
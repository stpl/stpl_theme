class StplThemeMigrationGenerator < Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "create_stpl_themes"
    end
  end
# private 
# def custom_file_name 
# custom_name = class_name.underscore.downcase 
# custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names 
# custom_name end  
# def yaffle_local_assigns 
# returning(assigns = {}) do  
# assigns[:migration_action] = "create" 
# assigns[:class_name] = "create_themes"  
# assigns[:table_name] = "create_themes" 
# assigns[:attributes] = [Rails::Generator::GeneratedAttribute.new("last_squawk", "string")] end 
#  end 
end 
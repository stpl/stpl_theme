class StplTheme < ActiveRecord::Base
  
  named_scope :get_theme_for, lambda { |themed_object_class_name , themed_object_id| 
    {
      :conditions => ["themed_object_class_name = ? and themed_object_id = ? ",themed_object_class_name.to_s.capitalize,themed_object_id]
    }
  }
end

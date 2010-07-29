module StplThemeModule      
  module StplThemedUser
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def can_select_theme name = ""
        include InstanceMethods
        @@default_model_theme = StplThemeModule::StplThemes.instance.get_theme_by_name(name) unless name.blank?
      end

      def get_default_name
        (defined?(@@default_model_theme) && !@@default_model_theme.blank?) ? @@default_model_theme : nil 
      end
    end

    module InstanceMethods
      def current_theme
        StplTheme.get_theme_for(self.class.to_s, self.id.to_i ).try(:first) || nil
      end

      def add_theme(theme_id)
        if current_theme.blank?
          StplTheme.create(:themed_object_class_name => self.class.to_s , :themed_object_id => self.id.to_i , :theme_id => theme_id)
        else
          current_theme.update_attributes(:theme_id => theme_id)
        end
      end

      def remove_theme
        current_theme.destroy unless current_theme.blank?
      end

      def has_theme?
        !current_theme.blank?
      end
    end
  end
end
ActiveRecord::Base.send(:include, StplThemeModule::StplThemedUser)

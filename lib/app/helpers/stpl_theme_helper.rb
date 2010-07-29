module StplThemeModule      
  module StplThemedHelper
    # apply the theme for themed object
    # if object doesn't have any theme then it will apply default model theme
    # and if default model theme is not specified then it will apply plugin's default theme
    def apply_theme themed_object
      theme = StplThemeModule::StplThemes.instance.get_theme(themed_object.current_theme.theme_id.to_i) || eval("#{themed_object.class.to_s.capitalize}.get_default_name") || StplThemeModule::StplThemes.instance.default_theme 
      return "<link rel='stylesheet' type='text/css' href='#{theme[theme.keys.first]["css_file_path"]}' ></link>" unless theme.blank?
    end

    # show available themes to user to select 
    def theme_selector themed_object
      unless themed_object.blank?
        @stpl_theme = themed_object.current_theme || StplTheme.new
        render 'stpl_themes/select_theme', :themed_object => themed_object
      else
        raise "Themed object not found. Please provide object to be themed."
      end
    end
  end
end
ActionView::Base.send("include",StplThemeModule::StplThemedHelper)
require 'yaml'
module StplThemeModule
  class StplThemes
    def initialize
      theme_file = Dir.glob("#{RAILS_ROOT}/config/stpl_theme.yml")
      @themes = {}
      unless theme_file .blank?
        theme_file .each do |file|
          file_object = YAML::load(File.open("#{file}"))
          file_object.each { |key ,value| @themes[key] = value  } unless file_object.blank?
        end
      else
        raise "Could not find stpl_theme.yml. run rake stpl_theme:init"
      end
    end
    @@instance = StplThemes.new
    def self.instance
      return @@instance
    end
    
    def get_theme(theme_id)
      {theme_id => @themes[theme_id] }
    end

    def get_all_themes
      @themes
    end

    def get_theme_by_name name
      theme = {}
      @themes.each { |k,v| theme[k] = v if v["name"].to_s == name.to_s }
      theme
    end

    def default_theme
      default = {}
      @themes.each { |k,v| default[k] = v if v["default"] == true }
      default
    end
    private_class_method :new
  end
end

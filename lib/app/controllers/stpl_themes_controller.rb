class StplThemesController < ApplicationController

  before_filter :set_stpl_theme_user

  def create
    render :text => "Ok" and return if @stpl_themed_user.add_theme(params[:theme_id])
    render :text => "Server can not process this request"   
  end

private
  def set_stpl_theme_user
    if defined?(current_user)
      @stpl_themed_user = current_user
    else
      @stpl_themed_user = eval("#{params[:themed_object_class_name].capitalize}.find(#{params[:themed_object_id]})")
      if @stpl_themed_user.blank?
        raise "Coundn't find the object to be themed"
      end
    end
  end

end

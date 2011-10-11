class ApplicationController < ActionController::Base

  layout :layout_by_resource

  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403
  end

protected
  def layout_by_resource
    if devise_controller?
      "check.html.erb"
    else
      "application.html.erb"
    end
  end
end

class ApplicationController < ActionController::Base
    
  def home
    render html: "syukatu_app"
  end
end

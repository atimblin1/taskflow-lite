class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  
  before_action :ensure_visitor_id
  
  private
  
  def ensure_visitor_id
    session[:visitor_id] ||= SecureRandom.uuid
  end
  
  def current_visitor_id
    session[:visitor_id]
  end
  helper_method :current_visitor_id
end

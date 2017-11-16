class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_event
    @current_event ||= Event.find_by(slug: params[:event])
  end
  helper_method :current_event
end

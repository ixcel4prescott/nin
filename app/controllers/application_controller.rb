class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  before_filter do
    if !current_user
      redirect_to new_user_session_url unless request.filtered_parameters["controller"] =~ /^devise\/|^users\//
    elsif  current_user.roles.count == 0
      redirect_to interpreter_sign_up_url unless request.filtered_parameters["controller"] =~ /^users\//
    end
  end

  protected

  def self.uses_an_organization!
    before_filter do
      @organization =
          if !current_user.nil? && current_user.has_role?( :client ) && current_user.person.has_exactly_one_organization?
            current_user.person.organizations.first
          elsif session[ :client_id ]
             Client.find( session[ :client_id ] )
          else
            redirect_to root_path, notice: "You need to select a client somehow..."
          end
    end
  end

end

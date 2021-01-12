class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:index]

  def after_sign_in_path_for(resource)
    mypage_root_path 
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end

module SessionsHelper
  def sign_in(user)
    session[:current_user_id] = user.id
    session[:current_user_email] = user.email
    session[:current_user_name] = user.name
    current_user = user
    #redirect_to current_user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id])    
    #@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def admin_?
    current_user.admin?
  end

  def sign_out
    current_user = nil
    #session[:current_user_id] = nil
    reset_session
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in." 
    end
  end

end

helpers do
  def logged_in?
    session[:id] !=nil
  end
end
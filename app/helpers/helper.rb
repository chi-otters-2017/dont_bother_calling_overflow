def login_check
  if session[:id].class == Fixnum
    true
  else
    false
  end
end

def current_user
  User.find(session[:id]).user_name
end

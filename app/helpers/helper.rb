def login_check
  if session[:id].class == Fixnum
    true
  else
    false
  end
end

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

def vote_check(user_id, voteable_type, voteable_id)
  test_user = User.find(user_id)
  test_array = test_user.votes.where({voteable_type: voteable_type, voteable_id: voteable_id})
  if test_array.length <= 0
    return true
  else
    return false
  end
end

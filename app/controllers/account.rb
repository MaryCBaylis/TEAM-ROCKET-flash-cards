patch '/account' do
  puts "[LOG] responding to a PATCH request for /account"
  puts "#{params.inspect}"
  if current_user
    current_user.update(params[:user]) 
  end 
  redirect '/account'
end 

delete '/account' do 
  puts "[LOG] responding to a DELETE request for /account"
  if current_user
    current_user.destroy
  end
  redirect '/'
end

get '/account/edit' do 
  puts "[LOG] responding to a GET request for /account/edit"
  if current_user
    erb :edit
  else 
    redirect '/'
  end 
end 

get '/account/logout' do
  session[:id] = nil
  @message = "You have been successfully logged out."
  erb :index
end

get '/ratings' do 
  puts "[LOG] responding to a GET request for /ratings"
  @ratings = Rating.all
  erb :ratings
end 

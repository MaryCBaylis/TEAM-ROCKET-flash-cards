get '/' do 
  erb :index
end 

get '/account/new' do 
  puts "[LOG] responding to a GET request for /account/new"
  puts "#{params.inspect}"
  @user = User.new
  erb :new
end

get '/account' do 
  puts "[LOG] responding to a GET request for /account"
  puts "#{params.inspect}"
  puts "Session id = #{session[:id]}"
  if session[:id] == nil
    @permission = false
    erb :account
  else
    @permission = true
    current_user
    erb :account
  end
end 

post '/account' do 
  puts "[LOG] responding to a POST request for /account"
  puts "#{params.inspect}"
  @user = User.authenticate(params[:user])
  if @user
    session[:id] = @user.id
    erb :account
  else
    redirect '/'
  end
end

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

get '/decks' do 
  puts "[LOG] responding to a GET request for /decks"
  @decks = Deck.all
  erb :decks
end 

get '/ratings' do 
  puts "[LOG] responding to a GET request for /ratings"
  @ratings = Rating.all
  erb :ratings
end 

get '/round' do 
  # what else should be here? 
  erb :round
end 

def current_user
  if session[:id] == nil
    return 
  else 
    @user = User.find(session[:id])
  end 
end 
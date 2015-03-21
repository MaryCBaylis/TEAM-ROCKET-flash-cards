get '/' do 
  erb :index
end 

get '/account/new' do 
  puts "[LOG] responding to a GET request for /account/new"
  erb :new
end

post '/account/new' do
  puts "[LOG] responding to a POST request for /account/new"
  @user = User.new(params[:user][:email], params[:user][:password])
  if @user.save
    redirect '/account'
  else 
    redirect '/account/new'
  end 
end

get '/account' do
  puts "[LOG] responding to a GET request for /account"
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
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user 
      session[:id] = @user.id
      erb :account
    else
    redirect '/'
    end
end

def current_user
  if session[:id] == nil
    return 
  else 
    @user = User.find(session[:id])
  end 
end 
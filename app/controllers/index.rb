get '/' do
  if logged_in?
    current_user
    redirect '/account'
  else
    erb :index
  end
end

get '/account/new' do
  puts "[LOG] responding to a GET request for /account/new"
  erb :new
end

post '/account/new' do
  puts "[LOG] responding to a POST request for /account/new"
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/account'
  else
    redirect '/account/new'
  end
end

get '/account' do
  puts "[LOG] responding to a GET request for /account"
  if logged_in?
    puts "Session id = #{session[:id]}"
    current_user
    erb :account
  else
    session[:id] == nil
    redirect '/'
  end
end

post '/account' do
  puts "[LOG] responding to a POST request for /account"
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user
      session[:id] = @user.id
      erb :account
    else
      @message = 'The email or password you entered was incorrect.'
      erb :index
    end
end

def current_user
  if session[:id] == nil
    return
  else
    @user = User.find(session[:id])
  end
end
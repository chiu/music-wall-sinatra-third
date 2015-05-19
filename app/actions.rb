helpers do
  def user_logged_in?
    session[:email] && session[:email] != ""
  end
 
  def get_current_user
    if user_logged_in?
      User.find_by_email(session[:email])
    end
  end
end
 
get '/' do
  redirect '/messages'
end
 
get '/login' do
  erb :'login'
end
 
post '/login' do
  @user = User.find_by_email(params[:email])
 
  if @user
    session[:email] = @user.email
    # session[:password] = @user.password
    redirect '/'
  end
end
 
get '/logout' do
  session[:email] = ""
  redirect '/'
end
 
get '/users' do
  @users = User.all
  erb :'users/index'
end
 
get '/users/new' do
  @user = User.new
  erb :'users/new'
end
 
post '/users' do
  @user = User.new(
    name: params[:name],
    password: params[:password],
    email: params[:email]
  )
  if @user.save
    redirect '/users'
  else
    erb :'user/new'
  end
end
 
get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end
 
get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end
 
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end
 
post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end
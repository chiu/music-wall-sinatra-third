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
  else
    # redirect '/users'
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
  redirect '/login' unless user_logged_in?
  @messages = Message.all
  # binding.pry
  @votes = Vote.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end


post '/messages' do
  @message = Message.new(

    song_title: params[:song_title],
    content: params[:content],
    author: params[:author],
    url: params[:url],
    user_id: get_current_user.id
    )

  @vote = Vote.new(
   user_id: get_current_user.id,
   message_id: @message.id

   )

  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end


get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end


get '/messages/:id/vote' do
  @message = Message.find params[:id]
  @message.upvote(get_current_user.id)
  # @message.user_id = get_current_user
  @message.save
  redirect '/messages'

end
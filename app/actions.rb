# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
  # erb :'index'
end



get '/messages/new' do
  erb :'messages/new'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end

post '/messages' do
  # binding.pry
  @message = Message.new(

    title: params[:title],
    # binding.pry
    content: params[:content],
    author:  params[:author],
    url: params[:url]
    )


  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end
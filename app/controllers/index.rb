get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/category/:category_id' do

  erb :category_id
end

get '/post/:category_id/:post_id' do

  erb :post_id
end

get '/create_post/:category_id' do 

  erb :create_post
end

post '/create_post/:category_id' do
  new_post = Post.new(:title => params[:title_input], :description => params[:desc_input], :category_id => params[:category_id])

  if new_post.save
    redirect "/edit/#{params[:category_id]}/#{new_post.id}/#{new_post.key}"
  else
    not_found
  end

  # redirect "/category/#{params[:category_id]}"
end

get '/edit/:category_id/:post_id/:key' do

  erb :edit_post
end

post '/edit/:category_id/:post_id/:key' do
  posting = Post.find(params[:post_id])
  posting.title = params[:title_input]
  posting.description = params[:desc_input]

  if posting.save
    redirect "/category/#{params[:category_id]}"
  else
    not_found
  end
end

not_found do
  'ERROR. PLEASE RETRY'
end
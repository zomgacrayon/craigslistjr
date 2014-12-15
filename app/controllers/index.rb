get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :index
end


get '/category/:id' do

  # Get the specific category
  @category = Category.find(params[:id])

  # Category HAS MANY Posts (has_many relationship) (to get all the post in the category)
  @posts = @category.posts

  erb :category_post
end

# RENDER THE NEW PAGE (FORM) TO CREATE NEW RECORD
get '/new_post' do

  @categories = Category.all

  erb :new_post
end

# ACTION TO CREATE THE RECORD
post '/new_post' do
  # puts params
  # {"title"=>"title here", "description"=>"desc here", "author"=>"author there", "email"=>"email there", "location"=>"KL", "category_id"=>"1"}
  # Get the category object taht specified in the form
  @category = Category.find(params[:category_id])

  @post = Post.new(params[:test])

  # It sets the category of the post (post belongs to a category)
  @post.category = @category
  @post.save

  redirect to("/post/#{@post.id}")
end

# TO SHOW/RENDER THE RECORD
get '/post/:id' do
  @post = Post.find(params[:id])

  erb :show_post
end

# TO SHOW/RENDER THE RECORD WITH EDITABLE FIELDS
get '/edit_post/:id' do
  # puts params
  @post = Post.find(params[:id])
  @categories = Category.all

  erb :edit_post
end

# TO PROCESS/UPDATE THE RECORD
put '/update_post/:id' do
  puts params

  @category = Category.find(params[:category_id])

  @post = Post.find(params[:id])
  @post.category = @category

  @post.update_attributes(params[:test])


  redirect to('/')
end


# Category.all
# -> ActiveRecord Relation (Like an array of many objects) -> []


# Category.first / Category.last / Category.find(1)
# -> ActiveRecord Object (One Object)

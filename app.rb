require "sinatra"
require "sinatra/activerecord"
require "./models"
require "sinatra/flash"

enable :sessions
set :database, "sqlite3:app.db"

# ============================================================
#   LANDING/HOME
# ============================================================
get "/" do
  if session[:user_id]
    erb :home
  else
    erb :landing
  end
end

# ============================================================
#   SIGN-UP/SIGN-IN/SIGN-OUT
# ============================================================
get "/sign-up" do
  erb :sign_up
end

post "/sign-up" do
  User.create(
    name: params[:name],
    email: params[:email],
    bday: params[:bday],
    password: params[:password]
  )
  @user = User.where(email: params[:email]).first
  session[:user_id] = @user.id
  flash[:notice] = "You have signed up"

  redirect "/home"
end

get "/sign-in" do
  erb :sign_in
end

post "/sign-in" do
  @user = User.where(email: params[:email]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You are signed in"

    redirect "/home"
  else
    redirect "/sign-in"
    flash[:error] = "Sorry, your email and password do not match."
  end
end

get "/sign-in-failed" do
  erb :sign_in_failed
end

get "/sign-out" do
  session[:user_id] = nil

  redirect "/"
end

def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  end
end

# ============================================================
#   HOME
# ============================================================
get "/home" do
  erb :home
end

# ============================================================
#   PROFILE
# ============================================================
# Current user profile
get "/profile" do
  @user = current_user
  
  erb :profile
end

get "/profile/:id" do
  @user = User.find(params[:id])
  
  erb :profile
end

# ============================================================
#   SETTINGS
# ============================================================
get "/settings" do
  erb :settings
end

# ============================================================
#   WRITE
# ============================================================
get "/write" do
  erb :write
end

post "/write" do 
  Post.create(
    line1: params[:line1],
    line2: params[:line2],
    line3: params[:line3],
    user_id: current_user.id
  )

  flash[:notice] = "you write a haiku"

  redirect "/profile"
end

# ============================================================
#   EDIT/DELETE POSTS
# ============================================================
get "/delete/:id" do
  @post = Post.find(params[:id])
  @post.destroy

  redirect back
end

# ============================================================
#   LIKE
# ============================================================
get "/like/:id" do
  @post = Post.find(params[:id])
  @post.update(likes: @post.likes + 1)

  redirect back
end


# ============================================================
#   FOLLOWING
# ============================================================




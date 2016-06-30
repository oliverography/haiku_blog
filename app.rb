require "sinatra"
require "sinatra/activerecord"
require "./models"
require "sinatra/flash"

enable :sessions
set :database, "sqlite3:app.db"

# ============================================================
#   INDEX/SPLASH
# ============================================================
get "/" do
  erb :index
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
    flash[:error] = "Sorry, your email and password do not match."
  end
end

get "/login-failed" do
  erb :login_failed
end

get "/sign-out" do
  session.delete(:user_id)
  @current_user = nil

  redirect "/"
end

def current_user
  if session[:user_id]
    User.find(session[:user_id])
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
get "/profile" do
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

post 

# ============================================================
#   FOLLOWING
# ============================================================




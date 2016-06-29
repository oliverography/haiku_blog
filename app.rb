require "sinatra"
require "sinatra/activerecord"
require "./models"
require "sinatra/flash"

enable :sessions
set :database, "sqlite3:app.db"

# ============================================================
#   SIGN-UP/SIGN-IN/SIGN-OUT
# ============================================================

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

def current_user
  if session[:user_id]
    User.find(session[:user_id])
  end
end

# ============================================================
#   EDIT PROFILE
# ============================================================




# ============================================================
#   DELETE USER
# ============================================================




# ============================================================
#   POSTING
# ============================================================




# ============================================================
#   FOLLOWING
# ============================================================




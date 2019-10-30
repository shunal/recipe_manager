class SessionsController < ApplicationController
  def new
  end

 
  
  
  
  
  
  
  
  
  
  def createfb
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
    u.name = auth['info']['name']
    u.email = auth['info']['email']
    u.image = auth['info']['image']
    u.password = SecureRandom.hex(12)
    end
  session[:user_id] = @user.id

  redirect_to @user
  end

  

  private
 
  def auth
    request.env['omniauth.auth']
  end
end
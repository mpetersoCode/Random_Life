class StaticPagesController < ApplicationController
  
  def home
    if signed_in?
       @micropost = current_user.microposts.build
     end 
  end
  
  def contact
  end
  
  def help
  end
  
  def about
  end
end
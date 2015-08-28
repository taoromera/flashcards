class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      clear_del_words(user)
      add_new_words(user)
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  # Add new words in the DB to the user study deck
  def add_new_words(user)
    Word.where(user_id: user.id).each do |w| 
      if !user.words.include?(w)
        user.words << w
      end
    end
  end

  # Clear deleted words in the DB from the user study deck
  def clear_del_words(user)
    ids = user.words.items.pluck("id")
    ids.each do |i|
      if Word.where(user_id: user.id).where(id: i).blank?
        puts "deleting " + i 
        user.words.items.find(i).delete
      end
    end
  end

end

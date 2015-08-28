class WordsController < ApplicationController

  def new
    @word = Word.new
  end

  def create
    @word = Word.create(word_params)
  end

  def study
    @word = current_user.words.next
  end

  def show_answer
    @word = Word.find(params[:word])
    @word.attributes.each do {|a| a.nil? ? a = "" : 0}
  end

  def knew
    current_user.right_answer_for!(Word.find(params[:word]))
    @word = current_user.words.next
    if @word.nil? 
      redirect_to root_path
    else
      render 'study'
    end
  end

  def missed
    current_user.wrong_answer_for!(Word.find(params[:word]))
    @word = current_user.words.next
    if @word.nil? 
      redirect_to root_path
    else
      render 'study'
    end
  end

private

  def word_params
    params.require(:word).permit!
  end


end

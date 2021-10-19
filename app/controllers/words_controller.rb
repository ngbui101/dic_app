class WordsController < ApplicationController
  before_action :set_word, only: %i[ show edit update destroy ]

  def index
    @words = Word.where(["word LIKE?","%#{params[:search]}%"])
  end
  def show
  end
  def new
    @word = Word.new
  end
  def edit
  end
  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to @word
    else 
      render :new
    end 
  end
  def update
    if @word.update(word_params)
      redirect_to @word
    else 
      render :new
    end 
  end
  def destroy
    @word.destroy
        redirect_to words_url
  end

  private
    def set_word
      @word = Word.find(params[:id])
    end
    def word_params
      params.require(:word).permit(:word, :definition)
    end
end

class WordsController < ApplicationController
  before_action :set_word, only: [ :show, :edit, :update, :destroy ]  
  
  def index
    if params[:search]
      search_term = params[:search].downcase
      @word = Word.all.select{ |word| word.word.downcase.include?(search_term)}
    else
      @word = Word.all
    end 
  end

  def show
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to @word
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @word.update
      redirect_to @word
    else
      render 'edit'
    end
  end

  def destroy
    @word.destroy
    redirect_to words_path
  end

  private
    def set_word
      @word = Word.find(params[:id])
    end
    def word_params
      params.require(:word).permit(:word, :definition, :wordtype, :language)
    end
end
  

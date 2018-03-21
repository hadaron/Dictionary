class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @words = Word.new
  end

  def create
    @words = Word.create(article_params)
    if @words.save
      redirect_to @words
    else
      render "new"
    end
  end

  def edit
    @words = Word.find(params[:id])
  end

  def update
    @words = Word.find(params[:id])
    if @words.update(article_params)
      redirect_to @words
    else
      render 'edit'
    end
  end

  def show
    @words = Word.find(params[:id])
  end

  def destroy
    @words = Word.find(params[:id])
    @words.destroy
    redirect_to words_path
  end

  private
  def article_params
    params.require(:word).permit(:ru, :en)
  end
end

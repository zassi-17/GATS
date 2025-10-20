class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @key_word = params[:key_word]

    if @model == "Member"
      @members = Member.looks(params[:search],params[:key_word])
    else
      @reviews = Review.looks(params[:search],params[:key_word])
    end
  end

  def genre_search
    @genre = Genre.find(params[:genre_id])
    @reviews = @genre.reviews.where(is_active: true).page(params[:page])
  end
end

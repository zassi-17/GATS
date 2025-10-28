class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
    @model = params[:model]
    @key_word = params[:key_word]

    if @model == "Member"
      @members = Member.looks(params[:search],params[:key_word]).where(is_active: true).page(params[:page])
    else
      @reviews = Review.looks(params[:search],params[:key_word]).where(is_active: true).page(params[:page])
    end
  end

  def genre_search
    @genre = Genre.find_by(id: params[:genre_id])
    if @genre.nil?
      @reviews = Review.where(is_active: true).page(params[:page])
    else
      @reviews = @genre.reviews.where(is_active: true).page(params[:page])
    end
  end
end

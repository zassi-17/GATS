class Public::SearchesController < ApplicationController

  def Search
    @model = params[:model]
    @key_word = params[:key_word]

    if @model == "Member"
      @members = Member.looks(params[:search],params[:key_word])
    else
      @reviews = Review.looks(params[:search],params[:key_word])
    end
  end
end

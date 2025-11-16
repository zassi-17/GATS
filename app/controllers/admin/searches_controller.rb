class Admin::SearchesController < ApplicationController
  def search
    @model = params[:model]
    @key_word = params[:key_word]

    if @model == "Member"
      @members = Member.looks(params[:search],params[:key_word]).page(params[:page])
    else
      @reviews = Review.looks(params[:search],params[:key_word]).page(params[:page])
    end
  end
end

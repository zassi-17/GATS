class Admin::SearchesController < ApplicationController
  def search
    @model = params[:model]
    @key_word = params[:key_word]

    #検索時、モデルタブで会員かレビュータイトルどちらを選んだか判定して検索する条件文
    if @model == "Member"
      @members = Member.looks(params[:search],@key_word).page(params[:page])
    else
      @reviews = Review.looks(params[:search],@key_word).page(params[:page])
    end
  end
end

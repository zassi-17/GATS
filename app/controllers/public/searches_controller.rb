class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
    @model = params[:model]
    @key_word = params[:key_word]

    #検索時、モデルタブで会員かレビュータイトルどちらを選んだか判定して検索する条件文
    if @model == "Member"
      @members = Member.looks(params[:search],@key_word).where(is_active: true)
                   .where.not(email: Member::GUEST_MEMBER_EMAIL).page(params[:page])
    else
      @reviews = Review.looks(params[:search],@key_word).where(is_active: true).page(params[:page])
    end
  end

  def genre_search
    @genre = Genre.find_by(id: params[:genre_id])

    #ジャンル検索タブを選ばず検索を押下された場合のエラー回避のための条件文
    if @genre.nil?
      @reviews = Review.where(is_active: true).page(params[:page])
    else
      @reviews = @genre.reviews.where(is_active: true).page(params[:page])
    end
  end
end

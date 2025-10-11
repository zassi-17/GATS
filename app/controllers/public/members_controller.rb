class Public::MembersController < ApplicationController
  before_action :authenticate_member!, only: [:mypage, :edit, :update, :withdraw]
  before_action :correct_member, only: [:edit, :update]

  def mypage
    @member = current_member
    @reviews = current_member.reviews.page(params[:page])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to public_mypage_path
    else
      render :edit
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def withdraw
    @member = current_member
    @member.update(is_active: false)
    sign_out(@member)
    redirect_to new_member_registration_path
  end

  private

  #ストロングパラメータ
  def member_params
    params.require(:member).permit(:image, :name, :introduction, :email, :favorite_game)
  end

  #他会員のプロフィールを編集を禁止するメソッド
  def correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
    redirect_to public_member_path(@member)
    flash[:alert] = "他会員のプロフィール編集は禁止です"
    end
  end


end

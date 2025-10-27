class Public::MembersController < ApplicationController
  before_action :authenticate_member!, only: [:mypage, :edit, :update, :withdraw]
  before_action :correct_member, only: [:edit, :update]

  def mypage
    @member = current_member
    @reviews = current_member.reviews.page(params[:page])
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:notice] = "プロフィール編集完了しました！"
      redirect_to public_mypage_path
    else
      render :edit
    end
  end

  def show
    @member = Member.find(params[:id])
    @reviews = @member.reviews.where(is_active: true)
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
    flash[:alert] = "他会員のプロフィール編集は禁止です"
    redirect_to public_mypage_path(@member)
    end
  end


end

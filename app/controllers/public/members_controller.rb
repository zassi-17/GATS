class Public::MembersController < ApplicationController
  before_action :current_member, only: [:edit, :update, :withdraw]

  def mypage
    @member = current_member
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
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:image, :name, :introduction, :email, :favorite_game)
  end

end

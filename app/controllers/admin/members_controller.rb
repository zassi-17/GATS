class Admin::MembersController < ApplicationController
  before_action :authenticate_member!

  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path
    else
      render :show
    end
  end



  private

  #ストロングパラメータ
  def member_params
    params.require(:member).permit(:image, :name, :introduction, :email, :favorite_game)
  end

end

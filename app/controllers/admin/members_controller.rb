class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.page(params[:page])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "編集完了しました！"
      redirect_to admin_members_path
    else
      render :edit
    end
  end



  private

  #ストロングパラメータ
  def member_params
    params.require(:member).permit(:image, :name, :introduction, :email, :favorite_game, :is_active)
  end

end

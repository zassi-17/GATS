class AddIntroductionToMembers < ActiveRecord::Migration[6.1]
  def change
    #自己紹介文
    add_column :members, :introduction, :text, null: false
  end
end

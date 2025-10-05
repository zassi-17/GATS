class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      #会員ID
      t.integer :member_id
      #ジャンルID（今後実装予定）
      t.integer :genre_id
      #ゲームタイトル
      t.string :title, null: false
      #本文
      t.text :body, null: false
      #公開ステータス
      t.boolean :is_active, default: true
      #星評価
      t.float :rating, default: 1

      t.timestamps
    end
  end
end

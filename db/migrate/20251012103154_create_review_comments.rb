class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.text :body, null: false
      t.integer :member_id
      t.integer :review_id

      t.timestamps
    end
  end
end

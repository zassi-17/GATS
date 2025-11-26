class AddUniqueIndexToGenresName < ActiveRecord::Migration[6.1]
  def change
    #ジャンル名に一意生を持たせる
    add_index :genres, :name, unique: true
  end
end

class AddLikeCountToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :like_count, :integer, default: 0

  end
end

json.user_data do
  json.user @user, :name, :age, :gender, :area_id, :home_gelaende, :image, :self_introduction, :comment_count
  json.comments do
    json.array! @user.comments, :park_id, :body, :like_count
  end
end

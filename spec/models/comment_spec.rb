# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  park_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_count :integer          default(0)
#


# == Schema Information
#
# Table name: lanes
#
#  id         :integer          not null, primary key
#  name       :string
#  items      :text
#  park_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Lane < ApplicationRecord
  belongs_to :park
  belongs_to :user

  validates :name, presence: true
  validates :items, presence: true
  validates :park_id, presence: true
  validates :user_id, presence: true

end

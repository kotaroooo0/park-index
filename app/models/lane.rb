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
#

class Lane < ApplicationRecord
  belongs_to :park
  has_many :users, through: :lane_users, dependent: :destroy
  has_many :lane_users, dependent: :destroy
  accepts_nested_attributes_for :lane_users

  validates :name, presence: true
  validates :items, presence: true
  validates :park_id, presence: true

end

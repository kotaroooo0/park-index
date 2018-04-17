# == Schema Information
#
# Table name: parks
#
#  id            :integer          not null, primary key
#  name          :string
#  comment_count :integer          default(0)
#  area_id       :integer
#  skiresort_id  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  picture       :string
#  description   :text
#

class Park < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :lanes, dependent: :destroy
  belongs_to :skiresort,counter_cache: :park_count

  validates :name, presence: true
  validates :area_id, presence: true
  validates :skiresort_id, presence: true
  validates :description, presence: true

end

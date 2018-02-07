class Lane < ApplicationRecord
  belongs_to :park

  validates :name, presence: true
  validates :items, presence: true

end

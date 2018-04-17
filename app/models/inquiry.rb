# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true

  def send_user_inquiry
    InquiryMailer.user_inquiry(self).deliver
  end
end

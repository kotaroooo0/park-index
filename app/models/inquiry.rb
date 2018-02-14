class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true

  def send_user_inquiry
    InquiryMailer.user_inquiry(self).deliver
  end
end

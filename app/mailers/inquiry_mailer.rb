class InquiryMailer < ApplicationMailer
  def user_inquiry(inquiry)
    @inquiry = inquiry
    mail to: 'k33asby@gmail.com', from: @inquiry.email, subject: "PARKINDEXお問い合わせ"
  end
end

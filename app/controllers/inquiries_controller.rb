class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      @inquiry.send_user_inquiry
      flash[:info] = 'お問い合わせありがとうございました'
      redirect_to new_inquiry_path
    else
      render 'new'
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :content)
  end
end

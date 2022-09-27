class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  # when preparing app for production, put a ternary statement or like to check if env is prod (SMTP), otherwise send as test
  self.delivery_method = :test

  def receipt(order)
    @order = order
    mail(to: @order.email, subject: 'Thank you for your purchase!')
  end

end

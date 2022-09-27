class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  self.delivery_method = :test

  def receipt(order)
    @order = order
    mail(to: @order.email, subject: 'Thank you for your purchase!')
  end

end

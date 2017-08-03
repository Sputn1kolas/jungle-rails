class UserMailer < ApplicationMailer
  def reciept(order)
    @order = order

    puts "sending order to #{@order.email}"
    mail(to: @order.email, subject: @order.id)
  end
end

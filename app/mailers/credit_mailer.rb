class CreditMailer < ApplicationMailer

	def creditpay_email(email)
		@email = email
		mail(to: @email, subject: 'Your Payment at BryceBurger')
	end
end

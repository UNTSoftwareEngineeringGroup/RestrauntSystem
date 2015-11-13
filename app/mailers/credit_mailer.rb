class CreditMailer < ApplicationMailer

	def creditpay_email(email, check)
		@email = email
		@check = check
		mail(to: @email, subject: 'Your Payment at BryceBurger')
	end
end

class CreditMailer < ApplicationMailer
	default from: 'caseycarroll2@my.unt.edu'

	def creditpay_email(email)
		@email = email
		mail(to: @email, subject: 'Your Payment at BryceBurger')
	end
end

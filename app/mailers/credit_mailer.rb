class CreditMailer < ApplicationMailer
	default from: 'caseycarroll2@my.unt.edu'

	def creditpay_email(user)
		@user = user
		mail(to: @user.email, subject: 'Your Payment at BryceBurger')
	end
end

class UserMailer < ActionMailer::Base
  default from: "javierdiazmunoz@gmail.com"

  def ask_for_rental(params)
  	@van = Van.find(params[:id])
  	@rental = Rental.find(params[:rental_id])
    @user = @van.user
    @url  = 'http://example.com/login'
   # @user.email = 'planetajavo@yahoo.es'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')

  end

end

class UserMailer < ActionMailer::Base
  default from: "info@sm-seamless.herokuapp.com"

  def user_order_confirmation(fullname, phone, email, phase, resting_option, wake, floral, transport, num_guests, veteran, user_email)
        @fullname = fullname
        @phone = phone
        @email = email
        @phase = phase
        @resting_option = resting_option
        @wake = wake
        @floral = floral
        @transport = transport
        @num_guests = num_guests
        @veteran = veteran

        @user_contact = user_email
        # @home_contact = 'shibani@kindreddevelopment.com'

        mail(to: @user_contact, subject: 'Your SM-Seamless Order')
  end
end

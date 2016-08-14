class RestaurantMailer < ActionMailer::Base
  default from: "info@sm-seamless.herokuapp.com"

  def resto_order_confirmation(name,address1,address2,city,state,zip,phone,order,submitted_at, resto_email)
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

        @resto_contact = resto_email
        # @home_contact = 'shibani@kindreddevelopment.com'

        mail(to: @resto_contact, subject: 'SM-Seamless Order')
  end
end

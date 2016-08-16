class RestaurantMailer < ActionMailer::Base
  default from: "postmaster@sandbox278e302a4c714163936c23aefdc7e5b5.mailgun.org"

  def resto_order_confirmation(name,address1,address2,city,state,zip,phone,user_email,cross_street,instructions,tax,tip,total,resto_name,submitted_at,resto_email)
        
        @name = name
        @address1 = address1
        @address2 = address2
        @city = city
        @state = state
        @zip = zip
        @phone = phone
        @user_email = user_email
        @cross_street = cross_street
        @instructions = instructions
        @tax = tax
        @tip = tip
        @total = total
        @resto_name = resto_name
        @submitted_at = submitted_at
        @resto_contact = resto_email

        mail(to: @resto_contact, subject: 'SM-Seamless Order')
  end
end

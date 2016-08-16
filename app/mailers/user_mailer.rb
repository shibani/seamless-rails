class UserMailer < ActionMailer::Base
  default from: "postmaster@sm-seamless.herokuapp.com"

  def user_order_confirmation(name,address1,address2,city,state,zip,phone,cross_street,instructions,tax,tip,total,resto_name,cardlast4,exp,submitted_at,user_email)

        @name = name
        @address1 = address1
        @address2 = address2
        @city = city
        @state = state
        @zip = zip
        @phone = phone
        @cross_street = cross_street
        @instructions = instructions
        @tax = tax
        @tip = tip
        @total = total
        @resto_name = resto_name
        @cardlast4 = cardlast4
        @exp = exp
        @submitted_at = submitted_at
        @user_contact = user_email

        mail(to: @user_contact, subject: 'Your SM-Seamless Order')
  end
end

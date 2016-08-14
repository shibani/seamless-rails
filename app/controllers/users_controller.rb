class UsersController < ApplicationController

  before_filter :authenticate_user_from_token!, :except => [:create, :show]
  #before_filter :authenticate_user!

  def new
    @bodyclass = "signup"
    @user = User.new
  end

  def show
    if params[:id]
      #@user = User.find_by username: params[:username]
      @user = User.find(params[:id])
    end
  end

  def show_json
    #authenticate user here
    if request.post? or request.patch?
      if params[:user][:token]
        @user = User.find_by(authentication_token: params[:user][:token])
        Rails.logger.debug "check: " + @user.username.inspect
      end
      respond_to do |format|
        format.html {  }
        format.json { render :json => { 
            :status => 200, 
            :firstname => @user.user_info.firstname,
            :lastname => @user.user_info.lastname,
            :address1 => @user.user_info.bill_address1,
            :address2 => @user.user_info.bill_address2,
            :city => @user.user_info.bill_city,
            :state => @user.user_info.bill_state,
            :zip => @user.user_info.bill_zip,
            :primary_phone => @user.user_info.primary_phone,
            :userId => @user.id 
          } 
        }
      end
    end
  end

  def add_address
    if request.post? or request.patch?
      if params[:user][:token]
        @user = User.find_by(authentication_token: params[:user][:token])
        Rails.logger.debug "check: " + @user.username.inspect
        if params[:address]
          @address = @user.addresses.new(address_params)
        end
      end
      #authenticate user here
      respond_to do |format|
        if @address.save
          format.html {  }
          format.json { render :json => { :status => 200, :message => "success"
            } 
          }
        end
      end
    end
  end

  def edit
  end

  def create
  end

  def user_info
    Rails.logger.debug "check: " + signin_params.inspect
    if request.post? or request.patch?
      if user_info_params
        @user = User.find_by(authentication_token: signin_params[:token])
        Rails.logger.debug "check: " + @user.id.inspect
        @user_info = UserInfo.find_by(user_id: @user.id)
        @user_info.update_attributes(firstname: user_info_params[:firstname], lastname: user_info_params[:lastname], primary_phone: user_info_params[:primary_phone], bill_address1: user_info_params[:address1], bill_address2: user_info_params[:address2], bill_city: user_info_params[:city], bill_state: user_info_params[:state], bill_zip: user_info_params[:zip])

        Rails.logger.debug "check: before Stripe"
        
        customer = Stripe::Customer.create(:email => @user.email)

        if @user_info.save
          @user.update_attribute(:stripe_id, customer.id)
          Rails.logger.debug "check: saved"
          #respond_to json here, send success/failure msgs back to app
          respond_to do |format|
            format.html {  }
            format.json { render :json => { :status => 200, :message => "success", :userId => @user.id, :custId => @user.stripe_id} }
          end
        end
      end
    end
  end

  def submit_token
    #Stripe::Customer.retrieve().sources.all(:limit => 3, :object => "card")
    #Rails.logger.debug "check: " + signin_params.inspect
    if request.post? or request.patch?
      @user = User.find_by(authentication_token: signin_params[:token])
      if card_params
        cards = Stripe::Customer.retrieve(@user.stripe_id).sources.all(:object => "card")
        Rails.logger.debug "check: " + cards.count.to_s
        Rails.logger.debug "check: " + cards.inspect
        if cards.count > 0 
          cards.each do |card|
            Rails.logger.debug "card: " + card[:last4].inspect
          end
          respond_to do |format|
            format.html {  }
            format.json { render :json => { :status => 200, :message => "cards on file" } }
          end
        else
          respond_to do |format|
            format.html {  }
            format.json { render :json => { :status => 200, :message => "no cards" } }
          end
        end 
      elsif charge_params 
        chg_amt = (charge_params[:amount]*100).to_i
        
        #update customer with currency amount and description
        customer = Stripe::Customer.retrieve(@user.stripe_id)
        cards = Stripe::Customer.retrieve(@user.stripe_id).sources.all(:object => "card")
        if cards.count > 0
          #*****check if credit card exists before creating*****
          card_fingerprint = Stripe::Token.retrieve(charge_params[:stripeToken]).try(:card).try(:fingerprint) 

          Rails.logger.debug "check: 0 cards: " + card_fingerprint.inspect

          unless card_fingerprint
            customer.sources.create(:source => charge_params[:stripeToken])
          end
        else
          customer.sources.create(:source => charge_params[:stripeToken])

          default_card = customer.sources.all.data.select{|card| card.fingerprint ==  card_fingerprint}.last if card_fingerprint 
        end
        begin
          charge = Stripe::Charge.create(
            amount: chg_amt, # in cents
            currency: charge_params[:currency],
            customer: customer.id,
            description: "some description of the product"
          )
        rescue Stripe::CardError => e
          status 402
          return "Card was declined: #{e.message}" 
        end

        Rails.logger.debug "check: " + charge.inspect

        #parse shopping cart items
        #"shoppingCart"=>{"Waffles"=>["1", "$11.00"], "Eggs Benedict"=>["1", "$14.00"]}

        user_email = params[:user][:email]
    
        tax = params[:orderDetails][:taxAmt]
        tip = params[:orderDetails][:tipAmt]
        total = (charge["amount"].to_f)/100

        cardlast4 = charge["source"]["last4"]
        Rails.logger.debug "check last4: " + cardlast4.inspect

        exp = '#{charge["source"]["exp_month"]}\#{charge["source"]["exp_year"]}'
        submitted_at = Time.now
        
        resto_name = params[:orderDetails][:restoName]
        resto = Restaurant.find_by(name: resto_name)
        #resto_email = resto.email
        resto_email = "shibani.mookerjee@gmail.com"

        order_items = params[:shoppingCart]

        Rails.logger.debug "check Order: " + order_items.inspect

        address_obj = params[:orderDetails][:deliveryLoc]
        
        if address_obj == "acct_primary"
          del_address = @user.user_info
          name = del_address.firstname + " " + del_address.lastname
          address1 = del_address.bill_address1
          address2 = del_address.bill_address2
          city = del_address.bill_city
          state = del_address.bill_state
          zip = del_address.bill_zip
          phone = del_address.primary_phone
          cross_street = "cross street not provided"
          instructions = "instructions not provided"
        else
          del_address = Address.find_by(place_type: address_obj)
          name = del_address.firstname + " " + del_address.lastname
          address1 = del_address.address
          address2 = del_address.address2
          city = del_address.city
          state = del_address.state
          zip = del_address.zip
          phone = del_address.phone
          cross_street = del_address.cross_street
          instructions = del_address.instructions
        end

        RestaurantMailer.resto_order_confirmation(name,address1,address2,city,state,zip,phone,user_email,cross_street,instructions,tax,tip,total,resto_name,submitted_at,resto_email).deliver

        UserMailer.user_order_confirmation(name,address1,address2,city,state,zip,phone,cross_street,instructions,tax,tip,total,resto_name,cardlast4,exp,submitted_at,user_email).deliver
        
        respond_to do |format|
          format.html {  }
          format.json { render :json => { :status => 200, :message => "success" } }
        end
      end
    end  
  end

  def signup_params
    if params[:user]
      params.require(:user).permit(:email, :name, :username, :password, :form, :hash_id)  
    end
  end

  def signin_params
    if params[:user]
      params.require(:user).permit(:email, :token, :stripe_id, :hash_id)  
    end
  end

  def user_info_params
    params.require(:user_info).permit(:firstname, :lastname, :address1, :address2, :city, :state, :zip, :primary_phone)
  end

  def address_params
    if params[:address]
      params.require(:address).permit(:firstname, :lastname, :address, :address2, :city, :state, :zip, :cross_street, :phone, :instructions, :place_type)
    end
  end

  def charge_params
    if params[:charge]
      params.require(:charge).permit(:stripeToken, :amount, :currency, :description)
    end
  end

  def card_params
    if params[:card]
      params.require(:card).permit(:last4, :exp, :cvv)
    end
  end

  private
  
  def authenticate_user_from_token!
    user_email = params[:user][:email].presence
    user       = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user][:token])
      sign_in user, store: false
    else
      redirect_to root_url, alert: "Not authorized" if !signed_in?
    end
  end
  #Rails.logger.debug "check: " + @path.inspect

  #error codes:
  #01 - email - is invalid
  #02 - email - already has an account associated with it
  #03 - name - is too short (minimum is 4 characters)
  #04 - name - is too long (maximum is 50 characters)
  #05 - password - can't be blank
  #06 - password - must be 8 characters or longer
end
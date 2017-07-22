class HomeController < ApplicationController
  skip_before_filter :check_session, :only => [:login,:logout]
  @@check_license = false
  def login

    # check license

    # is_license =Y5netLicense.check_license
    # puts "licen acative == #{is_license}"

    @username = params[:username]
    @password = params[:password]

    # if  is_license != true

    #     if !@username.nil?
    #         puts "_________ ativate licenst"
    #         @message = Y5netLicense.activate_license @username
    #         if @message == "Key activated"
    #            @@check_license =true
    #         end
    #     else
    #         puts "_________ ativate licenst"
    #         @message = is_license
    #     end

    #     render  '/home/login'
    # elsif

    if !@username.nil? && !@password.nil?

        @user = User.find_by username:@username

        if @user.nil?
            @message = "Incorrect User name "

            render  '/home/login'
        elsif @user.password == @password

            if @user.is_active == false
                @message = "Your account is deactive in system"

                render  '/home/login'
              else

              session[:user_id] = @user.id
              session[:user] = @user
              redirect_to root_path
            end

        else
            @message = "Incorrect Password"

            render  '/home/login'
        end
    end

    # @message = "Testing"

  end

  def logout
        reset_session
        render '/home/login'
  end

  def index

    puts "========= render html in putblic page"

  end
end

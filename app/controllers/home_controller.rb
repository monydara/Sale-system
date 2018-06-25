class HomeController < ApplicationController
  #skip_before_action :check_session, :only => [:login]

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


        render json:{ login:false , success:false , message:"Incorrect User name "}
      elsif 'admin'==@password #@user.password ==@password

        if @user.is_active == false

          render json:{ login:false , success:false , message:"Your account is deactive in system"}
        else

          session[:user_id] = @current_user.id
          session[:user] = @user
          redirect_to root_path
        end

      else

        render json:{ login:false , success:false , message: "Incorrect Password"}
      end
    end

    # @message = "Testing"

  end

  def logout
    reset_session
    render json:{  success:true , message: "Log out success"}
  end

  def index

    puts "========= render html in putblic page"

  end
end

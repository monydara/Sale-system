class ApplicationController < ActionController::API


  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Add a before_action to authenticate all requests.
  # Move this to subclassed controllers if you only
  # want to authenticate certain methods.
  before_action :authenticate

  protected

  # Authenticate the user with token based authentication
  def authenticate
   
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    puts '===============1'
    authenticate_with_http_token do |token, options|
      puts '===============2'
      puts token
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: 'Bad credentials', status: :unauthorized
  end


  # before_action :check_session #, only: [:index , :create, :udpate , :destroy ]
  #
  # def check_session
  #   begin
  #     puts "==== #{session[:user_id]}  , #{params['_dc']}"
  #     if session[:user_id]
  #       if session[:expiry_time] && session[:expiry_time].to_time < 60.minutes.ago
  #         reset_session
  #
  #         #redirect_to '/home/login'
  #         render json:{ login:false , success:false , message:"Need log in 1"}
  #       else
  #         session[:expiry_time] = Time.now
  #       end
  #     else
  #       #... authenticate
  #       session[:expiry_time] = Time.now
  #
  #       #redirect_to  '/home/login'
  #       render json:{ login:false , success:false , message:"Need log in2 "}
  #     end
  #   rescue Exception => e
  #     puts  "Error : #{e.message}"
  #     #redirect_to  '/home/login'
  #     render json:{ login:false , success:false , message: e.message}
  #   end
  #
  # end

end

class IndexController < ApplicationController
  
  def index
  end

  def login
  	

  	render :json =>{ :data=> 'test'}

  end
end

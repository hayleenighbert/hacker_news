class MainController < ApplicationController
	before_action :is_authenticated?, except: [:index]
	#question mark is used in ruby to return a boolean value

  def index
  	
  end

  def restricted
  end
end

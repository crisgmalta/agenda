class ApplicationController < ActionController::Base
    #devise
    before_action :authenticate_user! #, except: :index
end

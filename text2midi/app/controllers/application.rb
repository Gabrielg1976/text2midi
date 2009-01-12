class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # :secret => 'f44c3d0382cc8ad506e95ed8ddcded8f'
end

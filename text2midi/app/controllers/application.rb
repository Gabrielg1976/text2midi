class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => '1b837c6e9e4d8ae94613fece81e03c92'
end

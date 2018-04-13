class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @categories = Category.all # TODO: Is this needed? Confirm
end

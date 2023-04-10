class ApplicationController < ActionController::Base
  def index
  render({ :template => "currency_templates/step_one.html.erb" })
  end
end

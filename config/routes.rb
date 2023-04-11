Rails.application.routes.draw do
  # Root route
  root "application#index"

  # Routes for CurrenciesController
  get "/forex", { :controller => "currencies", :action => "first_currency" }

  get "/forex/:currency_symbol", { :controller => "currencies", :action => "second_currency" }

  get "/forex/:from_symbol/:to_currency", { :controller => "currencies", :action => "third_currency" }
end

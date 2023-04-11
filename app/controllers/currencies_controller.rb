class CurrenciesController < ApplicationController
  def first_currency
    # Fetch currency symbols from external API
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @array_of_symbols = @parsed_data.fetch("symbols").keys

    # Render template
    render({ :template => "currency_templates/step_one.html.erb", :locals => { :array_of_symbols => @array_of_symbols } })
  end

  def second_currency
    # Fetch currency symbols from external API
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    # Fetch selected currency symbol from params
    @first_symbol = params.fetch("currency_symbol")

    # Render template
    render({ :template => "currency_templates/step_two.html.erb", :locals => { :first_symbol => @first_symbol, :array_of_symbols => @array_of_symbols } })
  end

  def third_currency
    # Fetch currency symbols from external API
    @from_symbol = params.fetch("from_symbol")
    @to_symbol = params.fetch("to_currency")

    # Fetch exchange rate from external API
    @raw_data = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}").read
    @parsed_data = JSON.parse(@raw_data)
    @exchange_rate = @parsed_data.fetch("info").fetch("rate")

    # Render template
    render({ :template => "currency_templates/step_three.html.erb", :locals => { :from_symbol => @from_symbol, :to_symbol => @to_symbol, :exchange_rate => @exchange_rate } })
  end
end

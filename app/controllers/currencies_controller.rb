class CurrenciesController < ApplicationController
  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_symbols = @symbols_hash.keys
      render({ :template => "currency_templates/step_one.html.erb" })
  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    #params are
    #parameters: {"from_currency"="ARS"}

    @first_symbol = params.fetch("currency_symbol")

    render({ :template => "currency_templates/step_two.html.erb" })
  end

  def conversion
    @first = params.fetch("first_currency")
    @second = params.fetch("second_currency")

    @currency_raw = open("https://api.exchnagerate.host/convert?from=#{@first}&to=#{@second}").read
    @parsed_currency_data = JSON.parse(@currency_raw)

    @exchange_rate = @parsed_currency_data.fetch("info").fetch("rate")

    render({ :template => "currency_templates/results.html.erb"})
  end
end

def number_to_currency_eu(number)
  number_to_currency(number, :unit => "€", :separator => ",", :delimiter => ".")
end
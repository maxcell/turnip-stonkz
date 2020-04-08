module PriceHelper
    def latest_buying_price(user)
        buying_price = user.latest_buying_price
       
        "#{buying_price.price} Bells"
    end

    def latest_buying_date(user)
        buying_price = user.latest_buying_price
        I18n.l(buying_price.time_submitted, format: "%a, %-d %b %Y")
    end

    def selling_info(user)
        selling_prices = user.selling_prices

        selling_prices.map do |sp|
            date = I18n.l(sp.time_submitted, format: "%a, %-d %b %Y")
            {price: sp.price, date: date, time_of_day: sp.time_of_day}
        end
    end
end
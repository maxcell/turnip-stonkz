class BuyingPricesController < ApplicationController
    def create
        buying_price = BuyingPrice.new(buying_price_params)
        buying_price.user = current_user

        if buying_price.valid? 
            buying_price.save
            redirect_to :root
        end
    end

    private
    def buying_price_params
        params.require(:buying_price).permit(:price, :amount, :time_submitted)
    end
end
class SellingPricesController < ApplicationController
    def create
        selling_price = SellingPrice.new(selling_price_params)
        byebug
        selling_price.user = current_user

        if selling_price.valid? 
            selling_price.save
            redirect_to :root
        end
    end

    private
    def selling_price_params
        params.require(:selling_price).permit(:price, :time_submitted, :time_of_day)
    end
end
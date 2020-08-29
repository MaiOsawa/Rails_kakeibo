class StocksController < ApplicationController
    
    def index
        @stocks = Stock.all
    end
    
    def show
        @stock = Stock.find(params[:id])
    end
    
    def new
        @stock = Stock.new
    end
    
    def create
        stock_params = params.require(:stock).permit(:category, :amount)
        @stock = Stock.new(stock_params)
        if @stock.save
            redirect_to stocks_path
        else
            render :new
        end
    end
    
    def edit
        @stock = Stock.find(params[:id])
    end
    
    def update
        @stock = Stock.find(params[:id])
        stock_params = params.require(:stock).permit(:category, :amount)
        if @stock.update(stock_params)
            redirect_to stocks_path
        else
            render :edit
        end
    end
    
    def destroy
        @stock = Stock.find(params[:id])
        @stock.destroy
        redirect_to stocks_path
    end
    
end
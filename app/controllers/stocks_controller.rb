class StocksController < ApplicationController
    
    before_action :set_stock, only: [:show, :edit, :update, :destroy]
    
    def index
        @stocks = Stock.all
    end
    
    def show
    end
    
    def new
        @stock = Stock.new
    end
    
    def create
        stock_params = params.require(:stock).permit(:category, :amount)
        @stock = Stock.new(stock_params)
        if @stock.save
            flash[:notice] = "在庫管理にデータを１件登録しました"
            redirect_to stocks_path
        else
            flash.now[:alert] = "登録に失敗しました"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        stock_params = params.require(:stock).permit(:category, :amount)
        if @stock.update(stock_params)
            flash[:notice] = "データを１件更新しました"
            redirect_to stocks_path
        else
            flash.now[:alert] = "更新に失敗しました"
            render :edit
        end
    end
    
    def destroy
        @stock.destroy
        flash[:notice] = "削除しました"
        redirect_to stocks_path
    end
    
    private
    
    def set_stock
        @stock = Stock.find(params[:id])
    end
    
end
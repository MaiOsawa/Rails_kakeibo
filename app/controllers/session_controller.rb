class SessionController < ApplicationController
    
    def new
    end
    
    def create
     user = User.find_by(email: params[:email])
     if user.present? && user.authenticate(params[:password])
         flash[:notice] = "ログインしました"
     else
         flash[:alert] = "ログインに失敗しました"
         render "new"
     end
     
    end
end

class FarmerSessionController < ApplicationController

    def new
    end

    def create
        farmer = Farmer.find_by(email: params[:farmer_session][:email].downcase)
        if farmer && farmer.authenticate(params[:farmer_session][:password])
            farmer_log_in farmer
            params[:farmer_session][:remember_me] == '1' ? remember(farmer) : forget(farmer)
            redirect_to farmer_path(farmer)
        else
            flash.now[:danger] = "Emailアドレスまたはパスワードが間違っています。"
            render "new"
        end
    end

    def destroy
        farmer_log_out if farmer_loggedin?
        redirect_to root_path
    end
end

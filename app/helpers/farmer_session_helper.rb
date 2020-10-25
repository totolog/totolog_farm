module FarmerSessionHelper
        # 新規登録時に[:farmer_id]セッションにidを保存しておく
        def farmer_log_in(farmer)
            session[:farmer_id] = farmer.id
        end

        def remember(farmer)
            farmer.remember
            cookies.permanent.signed[:farmer_id] = user.id
            cookies. permanent[:remember_token] = farmer.remember_token
        end
    
        def current_farmer
            if (farmer_id = session[:farmer_id])
                @current_farmer ||= Farmer.find_by(id: farmer_id)
            elsif (farmer_id = cookies.signed[:farmer_id])
                farmer = Farmer.find_by(id:farmer_id)
                if farmer && farmer.authenticated?(cookies[:remember_token])
                    farmer_log_in farmer
                    @current_farmer = farmer
                end
            end
        end
    
        def farmer_loggedin?
            !current_farmer.nil?
        end

        def forget(farmer)
            farmer.forget
            cookies.delete(:farmer_id)
            cookies.delete(:remember_token)
        end
    
        def farmer_log_out
            forget(current_farmer)
            session.delete(:farmer_id)
            @current_farmer = nil
        end
end

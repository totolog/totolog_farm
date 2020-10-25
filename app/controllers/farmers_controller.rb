class FarmersController < ApplicationController

    def new
        @farmer_resister = Farmer.new
        @farmer_resister.farmer_images.build
    end

    def create
        @farmer_resister = Farmer.new(farmer_params)
        if @farmer_resister.save!
            farmer_log_in @farmer_resister
            flash.now[:success] = "農家の登録が完了しました。"
            redirect_to farmer_path(@farmer_resister.id)
        else
            flash.now[:danger] = "農家登録に失敗しました。お手数ですが、もう一度登録しなおしてください。"
            render "new"
        end
    end

    def destroy
    end

    private

    def farmer_params
        params.require(:farmer).permit(:name, :email, :tel, :postal_code, :prefecture, :address, :comment, :password, :password_confirmation, farmer_images_attributes:
        [
            :id, :farmer_logo, :farmer_image
        ])
    end
end

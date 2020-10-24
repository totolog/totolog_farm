class ProductsController < ApplicationController
    # 商品閲覧ページ
    def index
        @products = Product.all
    end

    # 商品詳細ページ
    def show
    end

    # 商品登録ページ
    def new
        @products = Product.new
        @image = @products.images.build
    end

    # 商品登録
    def create
        @product_resister = Product.new(product_tag_image_params)
        if @product_resister.save
            flash[:success] = "商品の登録が完了しました。"
            redirect_to products_path
        else
            flash[:danger] = "商品の登録ができませんでした。お手数ですが、もう一度登録しなおしてください。"
            render "new"
        end
    end

    # 商品情報編集ページ
    def edit
    end

    # 商品情報更新
    def update
    end

    private

    def product_tag_image_params
        params.require(:product).permit(:name, :price, :count, :category, :content, :comment, {tag_ids: []}, images_attributes:
        [
            :id, :img1, :img2, :img3, :img4, :img5
        ])
    end
end

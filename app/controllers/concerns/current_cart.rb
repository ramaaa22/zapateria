module CurrentCart
    private
        def set_cart
            @cart = Cart.find(current_user.id)
        rescue
            ActiveRecord::RecordNotFound
                @cart = Cart.new
                user = User.find(current_user.id)
                @cart.user = User.find(current_user.id)
                @cart.save
                #current_user.email
                #session[:cart_id] = @cart.id
        end
end
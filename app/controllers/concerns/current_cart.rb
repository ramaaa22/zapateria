module CurrentCart
    private
        def set_cart
            puts "current user #{current_user.id}"
            @cart = Cart.find_by("user_id"=>current_user.id)
            if @cart.nil?
                @cart = Cart.new
                user = User.find(current_user.id)
                @cart.user = User.find(current_user.id)
                @cart.save
            end
        end
end
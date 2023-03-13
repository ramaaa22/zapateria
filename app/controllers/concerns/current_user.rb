module CurrentUser
    private

        def redirect_unless_admin
            unless current_user.role==='Admin'
            flash[:error] = "Only admins can do that"
            redirect_to root_path
            end
        end
    end
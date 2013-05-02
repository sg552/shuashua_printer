# -*- encoding : utf-8 -*-
module ControllerMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user =  User.first || Factory.create(:user)
    sign_in user
  end
end

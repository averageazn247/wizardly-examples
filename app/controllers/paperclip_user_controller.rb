class PaperclipUserController < ApplicationController

  act_wizardly_for :paperclip_user, :form_data=>:session,
    :redirect=>'/main/index'

  on_post(:name) do
    @user_signup.first_name.capitalize!
    @user_signup.last_name.capitalize!
  end
  on_cancel(:all) do
    flash[:notice] = 'User signup wizard canceled'
  end
  on_finish(:account) do
    flash[:notice] = 'User signup successful'
  end
  on_errors(:account) do
    @user_signup[:password] = ''
    @user_signup[:password_confirmation] = ''
  end

end

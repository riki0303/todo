class Apps::AccountsController < Apps::ApplicationController
  def show
    @user = User.find(params[:id])
  end
end

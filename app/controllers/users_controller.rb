class User < ActiveRecord::Base
  def create
    @user = User.new(article_params)
    @user.password = params[:password]
    @user.save!
  end

  private
  def article_params
    params.require(:user).permit(:email, :full_name, :password, :password_conformation)
  end
end
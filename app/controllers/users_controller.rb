class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
  end

end

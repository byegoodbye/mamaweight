class UsersController < ApplicationController
  def show
    @babyname = current_user.babyname
  end

  def create
  end
end
class UsersController < ApplicationController
  before_filter :authenticate, only: :edit

  def edit
  end
end
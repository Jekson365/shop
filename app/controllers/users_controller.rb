class UsersController < ApplicationController
  def index
    users = User.where(deleted: false)
    render json: users
  end
  def create
    user = User.new(get_user_params)
    if user.save
      render json: {user:"saved!"}
    else
      render json: {errors: user.errors.full_messages}
    end
  end
  def destroy
    user = User.find_by(id: get_user_id)
    user.destroy
    render json: { user: 'user destroyed' }
  end
  def change_deleted
    user = User.find_by(id: get_user_id)
    user.deleted = !user.deleted
    user.save
    render json: user
  end
  def update
    user = User.find_by(id: get_user_id)
    user.update(update_params)
    render json: user
  end
  def admin_status
    user = User.find_by(id: get_user_id)
    user.is_admin = !user.is_admin
    user.save
    render json: {user: user}
  end

  private
  def get_user_id
    params[:id]
  end
  def update_params
    params.permit(:username,:password)
  end
  def get_user_params
    params.permit(:username, :password, :is_admin)
  end
end
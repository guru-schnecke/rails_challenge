class UsersController < ApplicationController
  def index
  end

  def create
  end

  def follow
    # find user from id
    @user = User.find(params[:id])

    @current_user_found= User.find(current_user.id)
    
    if @current_user_found.following.include?(@user.id.to_s)
     #if user is already following prompt error
      redirect_to show_profile_path(@user.username), alert: "Already Following this user"
    else
      
      @current_user_found.following << @user.id
      if @current_user_found.save

        redirect_to show_profile_path(@user.username), notice: "Now following user"
      else
          redirect_to show_profile_path(@user.username), notice: "couldnot follow user"
      end
    end
  end

  def unfollow
    # find user from id
    @user = User.find(params[:id])

    @current_user_found= User.find(current_user.id)
    
    if @current_user_found.following.include?(@user.id.to_s)
     #if user is already following prompt error
      
      @current_user_found.following.delete(@user.id.to_s)

      if @current_user_found.save

        redirect_to show_profile_path(@user.username), notice: "User unfollowed"
      else
          redirect_to show_profile_path(@user.username), notice: "couldnot unfollow user"
      end


    else
      redirect_to show_profile_path(@user.username), alert: "User does not follow"
  
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:id)
  end
end

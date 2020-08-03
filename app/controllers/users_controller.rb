class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :index, :show]

  def show
    @user=User.find(params[:id])
    @post_comment=PostComment.new
    @books=@user.books
    @book=Book.new
     #今だけ暫定的にこの表記。ログインしたユーザーの本の一覧のみにする必要がある。今は全ユーザーの本の投稿一覧となってしまっている。
    #@book=Book.new
    #@book.user_id=current_user.id
    #if @book.save
       #redirect_to book_path(@book.id) ,notice: "You have created book successfully."
    #else
      #render "index"
    #end
  end

  def edit
    @user=User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def index
    @users=User.all
    @book=Book.new
    #@user.id = current_user.id
    #@user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
      render "edit"
    end
  end





  #def correct_user
    #@user = current_user.users.find_by(id: params[:id])
    #unless @user
      #redirect_to user_path(@user.id)
    #end
  #end

  #before_action :correct_user, only: [:edit, :update]






  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

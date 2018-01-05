class MuttersController < ApplicationController
  before_action :set_mutter, only: [:edit, :update, :destroy, :show]
  before_action :no_log_in, only: [:new, :edit, :show]

  def index
    @mutters = Mutter.all
  end

  def new
    if params[:back]
      @mutter = Mutter.new(mutter_params)
    else
      @mutter = Mutter.new
    end
  end

  def create
    @mutter = Mutter.new(mutter_params)
    @mutter.user_id = current_user.id
    unless params[:cache] == nil
      @mutter.image.retrieve_from_cache! params[:cache][:image]
    end
    if @mutter.save
      ContactMailer.contact_mail(@mutter).deliver
      redirect_to mutters_path, notice: "つぶやきました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def confirm
    @mutter = Mutter.new(mutter_params)
    render :new if @mutter.invalid?
  end

  def destroy
    @mutter.destroy
    redirect_to mutters_path, notice:"削除しました！"
  end

  def update
    if @mutter.update(mutter_params)
      redirect_to mutters_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def show
   @favorite = current_user.favorites.find_by(mutter_id: @mutter.id)
  end

  private
  def mutter_params
    # params[:mutter]
    params.require(:mutter).permit(:content, :id, :image)
  end

  def set_mutter
    @mutter = Mutter.find(params[:id])
  end

  def no_log_in
    if current_user == nil
      redirect_to new_session_path, notice: "ログインして下さい"
    end
  end

end

class SubsController < ApplicationController
  before_action :ensure_logged_in
  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all 
    render :index 
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id 
    
    if @sub.save 
      redirect_to sub_url(@sub)
    else
      flash.now[:errors]  = @sub.errors.full_messages 
      render :new
    end

  end

  def show
    @sub  = Sub.find(params[:id])
  end

  def edit
    @sub  = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs.find(params[:id])
    # @sub.user_id = current_user.id
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages 
      render :edit 
    end
  end

  def sub_params 
    params.require(:sub).permit(:title, :description)
  end
end

class SushiRollsController < ApplicationController
  before_action :set_sushi, except:[:index, :new, :create] 
  
  def index
    @sushirolls = current_user.sushirolls.all
  end

  def show
    @sushiroll = current_user.sushirolls.find(params[:id])
  end

  def new
    sushiroll = current_user.sushirolls.new
  end

  def create
    @sushiroll = current_user.sushirolls.new(sushi_params)
    if @sushiroll.save
      redirect_to user_sushirolls_path(@sushiroll)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @sushiroll = current_user.sushirolls.new(sushi_params)
    if @sushiroll.update(sushi_params)
      redirect_to user_sushirolls_path(@sushiroll)
    else
      render :edit
    end
  end
  
  def destroy
    @sushiroll.destroy
  end

  private

    def sushi_params
      params.require(:sushiroll).permit(:name)
    end

    def set_sushi
      @sushiroll = current_user.sushirolls.find(params[:id])
    end
end

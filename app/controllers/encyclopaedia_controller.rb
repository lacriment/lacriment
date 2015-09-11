class EncyclopaediaController < ApplicationController
  before_action :set_encyclopaedium, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @encyclopaedia = Encyclopaedium.all.page params[:page]
  end


  def new
    @encyclopaedium = Encyclopaedium.new
  end


  def edit
  end

  def create
    @encyclopaedium = Encyclopaedium.new(encyclopaedium_params)

    if @encyclopaedium.save
      redirect_to encyclopaedia_path, notice: 'Encyclopaedium kaydedildi.'
    else
      render :new
    end
  end

  def update
    if @encyclopaedium.update(encyclopaedium_params)
      redirect_to encyclopaedia_path, notice: 'Encyclopaedium was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @encyclopaedium.destroy
    redirect_to encyclopaedia_path, notice: 'Encyclopaedium was successfully destroyed.'
  end

  private
    def set_encyclopaedium
      @encyclopaedium = Encyclopaedium.find(params[:id])
    end

    def encyclopaedium_params
      params.require(:encyclopaedium).permit(:title, :body)
    end
end

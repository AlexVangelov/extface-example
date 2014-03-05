class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update]
  before_action :set_shop_and_check_device, only: [:print_test, :print_file, :print_text]
  skip_before_action :authenticate_shop!, only: :index

  # GET /shops
  # GET /shops.json
  def index
    redirect_to current_shop if shop_signed_in?
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/1/edit
  def edit
    render partial: 'form'
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.js { redirect_via_turbolinks_to @shop, notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.js
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def print_test
    job = @shop.extface_device.driver.print_test_page(params[:count] ? params[:count].to_i : 1)
    render js: "document.extface_monitor('#{shop_extface_job_path(@shop, job)}');"
  end
  
  def print_file
    @job = @shop.extface_device.session do |s|
      s.print params[:file].read
    end
    render action: :show
  end
  
  def print_text
    job = @shop.extface_device.session do |s|
      s.print params[:text]
    end
    render js: "document.extface_monitor('#{shop_extface_job_path(@shop, job)}');"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :extface_device_id)
    end
    
    def set_shop_and_check_device
      @shop = Shop.find(params[:shop_id])
      if @shop.extface_device.nil? or @shop.extface_device.driver.nil?
        render js: "alert('Extface device or driver not present!');"
        return
      end
    end
end

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :clone, :upvote, :downvote]
  before_action :authenticate_admin!, only: [ :edit, :update, :destroy]
  # GET /cars
  # GET /cars.json
  def index
    @q = Car.ransack(params[:q])
    @cars = @q.result .search(params[:search]) .paginate(:page => params[:page], :per_page => 5)
    @q.build_sort if @q.sorts.empty?
  end
 def clone
  @car = Car.find(params[:id])
 end

  # GET /cars/1
  # GET /cars/1.json
  def show
   
   @w=0
   @t=0
  end

  # GET /cars/new
  def new
    @car = Car.new
    5.times { @car.azzets.build }
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
    5.times { @car.azzets.build }
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
 def update
    @car = Car.find(params[:id])
   
    if @car.update_attributes(params[:car])
      redirect_to @car, :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 def upvote 
   @car.upvote_from current_admin
   redirect_to cars_path
 end
 
 def downvote 
   @car.downvote_from current_admin
   redirect_to cars_path
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:marka, :model, :opis, :rocznik, :cena, :image,:inage)
    end
end

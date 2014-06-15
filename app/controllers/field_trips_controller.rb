class FieldTripsController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_field_trip, only: [:show, :edit, :update, :destroy]

  # GET /field_trips
  # GET /field_trips.json
  def index
    @field_trips = FieldTrip.all
  end

  # GET /field_trips/1
  # GET /field_trips/1.json
  def show
    @events = @field_trip.events
  end

  # GET /field_trips/new
  def new
    @field_trip = FieldTrip.new
  end

  # GET /field_trips/1/edit
  def edit
  end

  # POST /field_trips
  # POST /field_trips.json
  def create
    @field_trip = FieldTrip.new(field_trip_params)

    respond_to do |format|
      if @field_trip.save
        format.html { redirect_to @field_trip, notice: 'Field trip was successfully created.' }
        format.json { render :show, status: :created, location: @field_trip }
      else
        format.html { render :new }
        format.json { render json: @field_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_trips/1
  # PATCH/PUT /field_trips/1.json
  def update
    respond_to do |format|
      if @field_trip.update(field_trip_params)
        format.html { redirect_to @field_trip, notice: 'Field trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_trip }
      else
        format.html { render :edit }
        format.json { render json: @field_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_trips/1
  # DELETE /field_trips/1.json
  def destroy
    @field_trip.destroy
    respond_to do |format|
      format.html { redirect_to field_trips_url, notice: 'Field trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_trip
      @field_trip = FieldTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_trip_params
      params.require(:field_trip).permit(:name, :description, :start_time, :end_time, :company_id)
    end
end

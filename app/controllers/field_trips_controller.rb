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

    def sort_employees_no_preference

      employee_list = [{name: "Andres", role: "Manager"}, {name: "Jared", role: "Manager"}, {name: "Smith", role: "Developer"}, {name: "Jared", role: "Marketing"}]
      events_list = [{name: "Test 1", capacity: 3}, {name: "Test 2", capacity: 1}] #Sorted by size
      attendance_list = [[], []]
      role_buckets = {}

      #If there are not preferences
      employee_list.each do |e|
        role = e[:role]
        if !role_buckets.has_key? role
          role_buckets[role] = Array.new
        end

        role_buckets[role] << e
      end
      # Shuffle each bucket
      role_buckets.each do |key, value|
        value.shuffle!
      end

      queue = Array.new
      # Distribute equally to fill up the spots by making a custom flatten
      done = false
      begin
        role_buckets.keys.each do |key|
          list = role_buckets[key]
          if !list.empty?
            queue << list.take(1) # Takes the first element
            role_buckets[key] = list.drop(1) # Eliminates the first element
          end
        end

        role_buckets.keep_if {|key, value| !value.empty?}

      end while !role_buckets.empty?
      queue.flatten!

      # Now that all the employess were distributed equally
      # Shuffle the events and place them
      begin
        events_list.each_with_index do |event, index|
          puts "Adding to #{event[:name]}"
          puts "Count: #{attendance_list[index].count}/#{event[:capacity]}"
          if event[:capacity] > attendance_list[index].count
            puts "Have capacity for 1 person"
            attendance_list[index] << queue.take(1)
            queue = queue.drop(1)
          end
        end
      end while !queue.empty?

      puts attendance_list

    end
end

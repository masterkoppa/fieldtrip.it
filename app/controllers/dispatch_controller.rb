class DispatchController < ApplicationController
  protect_from_forgery except: ["confirm"]

  def confirm
    get_employee

    events = @employee.current_trip.events ### <- this is not working yet
    selection = params['Body'].to_i

    if selection.zero?
      @employee.not_attending!(@employee.current_trip)
    elsif selection.to_i <= events.size
      preferred_event = events[selection]
      @employee.prefer(preferred_event)
    end

    @employee.respond_to(@employee.current_trip)
  end

  def notify
    events = []
    field_trip = FieldTrip.find(params[:field_trip_id])

    events << "0. I'm Staying in"
    field_trip.events.each_with_index do |event, index|
      events << "#{index+1}. #{event.name}"
    end
    events = events.join("\n")
    message = "Today's options (reply with number of your preference)\n #{events}"

    field_trip.employees.each do |trip_employee|
      send_text(trip_employee.phone, message)
    end

    redirect_to field_trip_path(field_trip)
  end

  def set_groups
    field_trip = FieldTrip.find(params[:field_trip_id])

    field_trip.set_groups!

    field_trip.groups.each do |group|
      group.employees.each do |employee|
        other_employees = group.employees.select {|e| e.name != employee.name}.map(&:name)
        message = "You are going to #{group.event.name} with: #{other_employees.join('\n')}"
        send_text(employee.phone, message)
      end
    end

    redirect_to field_trip_path(field_trip)
  end


  private

  def get_employee
    from = params['From'].gsub("+1","")
    unless @employee = Employee.find_by(phone: from)
      head :not_found
    end
  end

  def send_text(phone, message)
    @client ||= Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    @client.account.sms.messages.create(
      from: ENV['TWILIO_FROM'],
      to:   phone,
      body: message)
  end

end
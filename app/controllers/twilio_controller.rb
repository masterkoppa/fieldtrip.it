class TwilioController < ApplicationController

  def dispatch(field_trip)
    events = []
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])

    events << "0. I'm Staying in"
    field_trip.events.each_with_index do |event, index|
      events << "#{index+1}. #{event.name}"
    end
    events = events.join("\n")

    field_trip.employees.each do |employee|
      client.account.sms.messages.create(
        from: ENV['TWILIO_FROM'],
        to:   employee.phone,
        body: "Today's options (reply with number of your preference)\n #{events}")
    end
  end

  def confirm
    get_employee
    events = @employee.current_trip.events
    body = params['Body']
    if body =~ /0.{0,1}/
      @employee.not_attending!(@employee.current_trip)
    elsif body.to_i < events.size
      @employee.prefer(events[body.to_i])
    end
  end

  private

  def get_employee
    unless @employee = Employee.find_by(phone: params['From'])
      head :not_found
    end
  end

end
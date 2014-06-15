class Restaurant < ActiveRecord::Base

  def getReservationTypes
    ["Open Table", "Yelp", "Phone"]
  end

end

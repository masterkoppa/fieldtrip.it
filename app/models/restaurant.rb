class Restaurant
  include ActiveModel::Model

  attr_accessor :reservation_type, :url

  validates :reservation_type, inclusion: { in: ["Open Table", "Yelp", "Phone"],
                                message: "%{value} is not a valid type" }
  def self.getReservationTypes
    ["Open Table", "Yelp", "Phone"]
  end

  def to_hash
    {:reservation_type => @reservation_type, :url => @url}
  end

end

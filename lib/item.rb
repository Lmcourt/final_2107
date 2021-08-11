class Item

  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(person, amt)
    @bids[person] = amt
  end

  def current_high_bid
    @bids.values.max
  end


  #this was frustrating.
  def close_bidding
    @bids.reject! do |a, bid|
      add_bid(a, bid)
    end
  end
end

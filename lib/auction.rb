class Auction

  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    @items.sum do |item|
      item.current_high_bid.to_i
    end
  end

  def bidders
    @items.flat_map do |item|
      item.bids.map do |attendee, amt|
        attendee.name
      end
    end.uniq
  end

  def bidder_info
    info = Hash.new
    @items.each do |item|
      item.bids.find_all do |attendee, amt|
        if info[attendee].nil?
          info[attendee] = {budget: attendee.budget, items: [item]}
        else
          info[attendee][:budget] = attendee.budget
          info[attendee][:items] << item
        end
      end
    end
    info
  end
end

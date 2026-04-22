DISCOUNTS = [1.00, 0.95, 0.90, 0.80, 0.75]

module BookStore
  def self.calculate_price(basket)
    groups = []
    until basket.empty?
      current_group = basket.uniq
      current_group.each { basket.delete_at(basket.index(_1)) }
      groups << current_group.length
    end
    
    while groups.include?(3) && groups.include?(5)
      groups.delete_at(groups.index(3))
      groups.delete_at(groups.index(5))
      groups << 4 << 4
    end
    
    8.00 * groups.sum { |g| g * DISCOUNTS[g-1] }
  end
end
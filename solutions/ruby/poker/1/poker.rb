class Poker
  def initialize(hands)
    @hands = hands
  end

  def best_hand
    hand_values = @hands.map { Poker.evaluate(_1) }
    @hands.select { hand_values[@hands.index(_1)] == hand_values.max }
  end

  private
  def self.evaluate(hand)
    suits = hand.map { _1[-1] }
    ranks = hand.map { _1[0...-1] }.map do |rank|
      rank.match?(/\d/) ? rank.to_i : 11 + %w[J Q K A].index(rank)
    end
    counts = ranks.map { ranks.count(_1) }
    # low ace if it allows a 5-high straight
    ranks = [1, 2, 3, 4, 5] if ranks.sort == [2, 3, 4, 5, 14]

    code = 0
    # straight flush is straight + flush = 17
    # four of a kind
    code += 11 if counts.include?(4)
    # full house is triplet + pair = 10
    # flush
    code += 9 if suits.uniq.length == 1
    # straight
    code += 8 if (ranks.max - ranks.min == 4) && ranks.uniq.length == 5
    # triplet
    code += 7 if counts.include?(3)
    # single pair is 3, double pair is 6
    code += 3 * counts.count(2) / 2
    
    ranks.sort_by! { [counts[ranks.index(_1)], _1] }
         .push(code)
         .each_with_index
         .sum { |val, i| val * 100 ** i }
  end
end
module Blackjack
  def self.parse_card(card)
    case card
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten", "jack", "queen", "king" then 10
    when "ace" then 11
    else 0
    end
  end

  def self.card_range(card1, card2)
    case [card1, card2].map {|c| parse_card(c)}.sum
    when (4..11) then "low"
    when (12..16) then "mid"
    when (17..20) then "high"
    when 21 then "blackjack"
    when 22 then "busted"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    dealer_score = parse_card(dealer_card)
    case card_range(card1, card2)
    when "busted" then "P"
    when "blackjack" then dealer_score < 10 ? "W" : "S"
    when "high" then "S"
    when "mid" then dealer_score < 7 ? "S" : "H"
    when "low" then "H"
    end
  end
end

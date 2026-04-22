module BottleSong
  NUMBERS = %w[ten nine eight seven six five four three two one no]
  def self.recite(n_bottles, n_verses)
    (1..n_verses).map do |i|
      index = 10 - n_bottles
      s = n_bottles == 1 ? "" : "s"
      bar1 = "#{NUMBERS[index].capitalize} green bottle#{s} hanging on the wall,\n" * 2
      bar2 = "And if one green bottle should accidentally fall,\n"
      s = n_bottles == 2 ? "" : "s"
      bar3 = "There'll be #{NUMBERS[index + 1]} green bottle#{s} hanging on the wall.\n"
      n_bottles -= 1

      [bar1, bar2, bar3].join
    end.join("\n")
  end
end
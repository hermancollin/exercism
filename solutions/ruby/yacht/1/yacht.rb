class Yacht
  attr_reader :score
  def initialize(dices, category)
    @dices = dices
    @score = self.send(category.gsub(" ", "_").to_sym)
  end

  [:ones, :twos, :threes, :fours, :fives, :sixes].each_with_index do |name, i|
      define_method(name) { (i+1) * @dices.count(i+1) }
  end

  def yacht = @dices.uniq.length == 1 ? 50 : 0
  def full_house = @dices.tally.values.sort == [2,3] ? @dices.sum : 0
  def four_of_a_kind = (1..6).sum { |i| @dices.count(i) >= 4 ? 4 * i : 0 }
  def little_straight = @dices.sort == [1, 2, 3, 4, 5] ? 30 : 0
  def big_straight = @dices.sort == [2, 3, 4, 5, 6] ? 30 : 0
  def choice = @dices.sum
end
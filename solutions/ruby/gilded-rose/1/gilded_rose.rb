Item = Struct.new(:name, :sell_in, :quality) do
  
  def initialize(name:, sell_in:, quality:)
    super(name, sell_in, quality)
    @type = case name.downcase
      when /aged brie/ then :brie
      when /backstage passes/ then :passes
      when /sulfuras, hand of ragnaros/ then :sulfuras
      else :normal
      end
    @conjured = name.downcase.match?("conjured")
  end

  def update!
    diff = sell_in <= 0 ? 2 : 1
    
    case @type
    when :normal
      diff *= 2 if @conjured
      self.quality = [quality - diff, 0].max
    when :brie
      self.quality = [quality + diff, 50].min
    when :passes
      increment = sell_in < 6 ? 3 : sell_in < 11 ? 2 : 1
      increment -= 1 if @conjured
      self.quality = [quality + increment, 50].min
      self.quality = 0 if sell_in <= 0
    end

    self.quality = 0 if @conjured && sell_in <= 0
    self.sell_in = sell_in - 1 unless @type == :sulfuras && !@conjured
  end
end

class GildedRose
  def initialize(items) = @items = items

  def update! = @items.each(&:update!)
end

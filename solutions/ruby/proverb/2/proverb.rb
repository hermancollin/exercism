class Proverb
  def initialize(*words, qualifier: nil)
    @words = words
    @adj = qualifier
  end

  def to_s
    return "" if @words.length == 0
    lines = @words.each_cons(2).map do |item1, item2|
      "For want of a #{item1} the #{item2} was lost."
    end.push("").join("\n")
    wanted = "#{@adj ? @adj + " " : ""}#{@words.first}"
    lines += "And all for the want of a #{wanted}."
  end
end
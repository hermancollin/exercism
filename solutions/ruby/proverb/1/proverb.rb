class Proverb
  def initialize(*chain, **modifiers)
    @words = chain
    @qualifier = modifiers[:qualifier] if modifiers
  end

  def to_s
    lines = ""
    return lines if @words.length == 0
    @words.each_cons(2) do |item1, item2|
      lines += "For want of a #{item1} the #{item2} was lost.\n"
    end
    wanted = @words[0]
    wanted = "#{@qualifier} " + wanted if @qualifier
    lines += "And all for the want of a #{wanted}."
  end
end
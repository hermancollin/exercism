module Bob
  def self.hey(remark)
    return "Fine. Be that way!" if remark.strip.empty?
    is_question = remark.strip[-1] == "?"
    is_shouting = !remark.match?(/[a-z]/) && remark.match?(/[A-Z]/)
    return "Calm down, I know what I'm doing!" if is_question && is_shouting
    return "Sure." if is_question
    return "Whoa, chill out!" if is_shouting
    return "Whatever."
  end
end
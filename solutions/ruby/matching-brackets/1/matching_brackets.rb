OPENING = {"]" => "[", "}" => "{", ")" => "("}.freeze

module Brackets
  def Brackets.paired?(text)
    pile = []
    text.each_char do |char|
      case char
      when *OPENING.values then pile.push(char)
      when *OPENING.keys
        if pile.last == OPENING[char] then pile.pop 
        else return false 
        end
      end
    end
    pile.length == 0
  end
end
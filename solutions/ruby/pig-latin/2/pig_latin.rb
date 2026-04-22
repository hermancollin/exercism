class String
  def piglatin
    if self.match?(/\b[aeiou]+|\bxr|\byt/)  # rule 1
      self + 'ay'
    else
      if self.match(/\b[^aeiou]*qu/)        # rule 3
        $' + $& + 'ay'
      elsif self.match(/\b([^aeiou]+)y/)    # rule 4
        'y' + $' + $1 + 'ay'
      elsif self.match(/\b[^aeiou]+/)       # rule 2
        $' + $& + 'ay'
      end
    end
  end
end

module PigLatin
  def self.translate(words) = words.split.map(&:piglatin).join(' ')
end
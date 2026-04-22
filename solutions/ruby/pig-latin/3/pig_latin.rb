class String
  def piglatin
    return self + 'ay' if self.match?(/\b[aeiou]+|\bxr|\byt/)
    return $' + $& + 'ay' if self.match(/\b[^aeiou]*qu/)
    return 'y' + $' + $1 + 'ay' if self.match(/\b([^aeiou]+)y/)
    return $' + $& + 'ay' if self.match(/\b[^aeiou]+/)
  end
end

module PigLatin
  def self.translate(words) = words.split.map(&:piglatin).join(' ')
end
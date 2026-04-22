module PigLatin
  def self.translate(words)
    words.split.map do |word|
      if word.match?(/\b[aeiou]+|\bxr|\byt/)  # rule 1
        word + 'ay'
      else
        if word.match(/\b[^aeiou]*qu/)        # rule 3
          $' + $& + 'ay'
        elsif word.match(/\b([^aeiou]+)y/)    # rule 4
          'y' + $' + $1 + 'ay'
        elsif word.match(/\b[^aeiou]+/)       # rule 2
          $' + $& + 'ay'
        end
      end
    end.join(' ')
  end
end
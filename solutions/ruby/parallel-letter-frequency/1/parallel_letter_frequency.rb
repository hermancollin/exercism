module ParallelLetterFrequency
  def self.count(texts)
    
    counter = Ractor.new(name: "counter") do
      result = Hash.new(0)
      while (word = Ractor.receive)
        word.downcase.each_char { |char| result[char] += 1 }
      end
      result
    end

    Ractor.new(counter, texts, name: "reader") do |worker, texts|
      texts.each do |text|
        text.scan(/\p{L}+/) { |word| worker.send(word)}
      end
      worker.send(nil)
    end

    counter.take
  end
end
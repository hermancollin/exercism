class InvalidCodonError < StandardError; end

module Translation
  def self.of_rna(strand)
    result = []
    strand.scan(/.{1,3}/).each do |codon|
      case codon
      when "AUG" then result << "Methionine"
      when "UUU", "UUC" then result << "Phenylalanine"
      when "UUA", "UUG" then result << "Leucine"
      when "UCU", "UCC", "UCA", "UCG" then result << "Serine"
      when "UAU", "UAC" then result << "Tyrosine"
      when "UGU", "UGC" then result << "Cysteine"
      when "UGG" then result << "Tryptophan"
      when "UAA", "UAG", "UGA" then break
      else raise InvalidCodonError
      end
    end
    result
  end
end
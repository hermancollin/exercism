class Nucleotide < String
  def Nucleotide.from_dna(dna) 
    raise ArgumentError if dna.match(/[^ATCG]/)
    new(dna)
  end
  
  def histogram
    %w[A T C G].map { |nucleotide| [nucleotide, self.count(nucleotide)] }.to_h
  end
end
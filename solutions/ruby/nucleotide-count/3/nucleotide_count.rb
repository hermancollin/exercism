class Nucleotide < String
  def Nucleotide.from_dna(dna) 
    raise ArgumentError if dna.match(/[^ATCG]/)
    new(dna)
  end
  
  def histogram = %w[A T C G].map { |x| [x, self.count(x)] }.to_h
end
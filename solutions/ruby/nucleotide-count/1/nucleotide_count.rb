class Nucleotide
  def initialize(dna)
    raise ArgumentError if dna.match(/[^ATCG]/)
    @dna = dna
  end

  def Nucleotide.from_dna(dna) = new(dna)

  def histogram
    %w[A T C G].map { |nucleotide| [nucleotide, @dna.count(nucleotide)] }.to_h
  end
end
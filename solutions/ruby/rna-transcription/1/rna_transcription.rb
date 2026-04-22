module Complement
  DNA_TO_RNA = {G: 'C', C: 'G', T: 'A', A: 'U'}
  
  def self.of_dna(dna_strand)
    dna_strand.each_char.map { |x| DNA_TO_RNA[x.to_sym] }.join
  end
end
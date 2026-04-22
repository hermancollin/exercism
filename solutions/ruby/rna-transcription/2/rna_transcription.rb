module Complement
  DNA, RNA = "GCTA", "CGAU"
  
  def self.of_dna(dna_strand)
    dna_strand.tr(DNA, RNA)
  end
end
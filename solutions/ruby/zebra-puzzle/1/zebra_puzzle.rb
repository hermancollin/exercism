Solution = Struct.new(:colors, :origins, :pets, :drinks, :hobbies)

class ZebraPuzzle
  @solution = nil
  
  def self.water_drinker
    @solution = ZebraPuzzle.solve unless @solution
    @solution.origins[@solution.drinks.index("water")]
  end
  
  def self.zebra_owner
    @solution = ZebraPuzzle.solve unless @solution
    @solution.origins[@solution.pets.index("zebra")]
  end
  
  private
  def self.constraint?(set1, val1, set2, val2, pos=0)
    (0..4).any? { |i| set1[i] == val1 && set2[i + pos] == val2 }
  end
  
  def self.next_to?(set1, val1, set2, val2)
    return self.constraint?(set1, val1, set2, val2, 1) ||
           self.constraint?(set2, val2, set1, val1, 1)
  end
  # reste 3
  
  def self.solve
    %w[red blue yellow green ivory].permutation.each do |colors|
      # rule 6
      next unless self.constraint?(colors, "ivory", colors, "green", 1)
      # rule 15 (and 10)
      next unless colors[1] == "blue"
      
      %w[Norwegian Englishman Spaniard Japanese Ukrainian].permutation.each do |origins|
        # rule 2
        next unless self.constraint?(origins, "Englishman", colors, "red")
        # rule 10
        next unless origins[0] == "Norwegian"
        
        %w[zebra dog snail fox horse].permutation.each do |pets|
          # rule 3
          next unless self.constraint?(pets, "dog", origins, "Spaniard")
          %w[milk water coffee tea orange-juice].permutation.each do |drinks|
            # rule 9
            next unless drinks[2] == "milk"
            # rule 4
            next unless self.constraint?(drinks, "coffee", colors, "green")
            # rule 5
            next unless self.constraint?(drinks, "tea", origins, "Ukrainian")
            %w[dance read paint football chess].permutation.each do |hobbies|
              # rule 7
              next unless self.constraint?(hobbies, "dance", pets, "snail")
              # rule 8
              next unless self.constraint?(hobbies, "paint", colors, "yellow")
              # rule 11
              next unless self.next_to?(hobbies, "read", pets, "fox")
              # rule 12
              next unless self.next_to?(hobbies, "paint", pets, "horse")
              # rule 13
              next unless self.constraint?(hobbies, "football", drinks, "orange-juice")
              # rule 14
              next unless self.constraint?(hobbies, "chess", origins, "Japanese")
              
              return Solution.new(colors, origins, pets, drinks, hobbies)
            end
          end
        end
      end
    end
  end
end

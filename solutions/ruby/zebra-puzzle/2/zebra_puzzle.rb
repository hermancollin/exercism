Solution = Struct.new(:colors, :origins, :pets, :drinks, :hobbies)

class ZebraPuzzle
  @@solution = nil
  
  def self.water_drinker
    @@solution = ZebraPuzzle.solve unless @@solution
    @@solution.origins[@@solution.drinks.index("water")]
  end
  
  def self.zebra_owner
    @@solution = ZebraPuzzle.solve unless @@solution
    @@solution.origins[@@solution.pets.index("zebra")]
  end
  
  private
  def self.solve
    %w[red blue yellow green ivory].permutation.each do |colors|
      next unless constraint?(colors, "ivory", colors, "green", 1)
      next unless colors[1] == "blue"
      %w[Norwegian Englishman Spaniard Japanese Ukrainian].permutation.each do |origins|
        next unless constraint?(origins, "Englishman", colors, "red")
        next unless origins[0] == "Norwegian"
        %w[zebra dog snail fox horse].permutation.each do |pets|
          next unless constraint?(pets, "dog", origins, "Spaniard")
          %w[milk water coffee tea orange-juice].permutation.each do |drinks|
            next unless drinks[2] == "milk"
            next unless constraint?(drinks, "coffee", colors, "green")
            next unless constraint?(drinks, "tea", origins, "Ukrainian")
            %w[dance read paint football chess].permutation.each do |hobbies|
              next unless constraint?(hobbies, "dance", pets, "snail")
              next unless constraint?(hobbies, "paint", colors, "yellow")
              next unless next_to?(hobbies, "read", pets, "fox")
              next unless next_to?(hobbies, "paint", pets, "horse")
              next unless constraint?(hobbies, "football", drinks, "orange-juice")
              next unless constraint?(hobbies, "chess", origins, "Japanese")

              return Solution.new(colors, origins, pets, drinks, hobbies)
            end
          end
        end
      end
    end
  end
  
  def self.constraint?(set1, val1, set2, val2, pos=0)
    (0..4).any? { |i| set1[i] == val1 && set2[i + pos] == val2 }
  end
  
  def self.next_to?(set1, val1, set2, val2)
    return constraint?(set1, val1, set2, val2, 1) ||
           constraint?(set2, val2, set1, val1, 1)
  end
end

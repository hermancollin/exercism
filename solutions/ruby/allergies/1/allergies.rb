class Allergies
  ALLERGENS = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
  
  attr_reader :score
  def initialize(allergy_score)
    @score = (allergy_score % 256).to_s(2).reverse
  end

  def allergic_to?(allergen)
    @score[ALLERGENS.index(allergen)] == "1"
  end

  def list
    ALLERGENS.filter { self.allergic_to?(_1) }
  end
end
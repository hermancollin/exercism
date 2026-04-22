class DndCharacter
  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  def best_of_4_rolls
    prng = Random.new
    (0..3).map { |_| prng.rand(5) + 1 }
      .sort
      .last(3)
      .sum
  end

  attr_reader(
    :strength, :dexterity, :constitution,
    :intelligence, :wisdom, :charisma, :hitpoints
  )
  def initialize
    @strength = best_of_4_rolls
    @dexterity = best_of_4_rolls
    @constitution = best_of_4_rolls
    @intelligence = best_of_4_rolls
    @wisdom = best_of_4_rolls
    @charisma = best_of_4_rolls
    @hitpoints = 10 + DndCharacter.modifier(constitution)
  end
end

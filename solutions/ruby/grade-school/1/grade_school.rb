class School
  def initialize = @students = Hash.new([])
  def grade(i) = @students[i].sort
  def roster = @students.sort.to_h.values.map(&:sort).flatten
    
  def add(name, grade)
    name_exists = roster.include?(name)
    @students[grade] = @students[grade] + [name] unless name_exists
    return !name_exists
  end
end
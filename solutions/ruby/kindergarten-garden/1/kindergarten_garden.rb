class Garden
  CHILDREN = %w[ 
    alice bob charlie david eve fred ginny
    harriet ileana joseph kincaid larry 
  ]
  ENCODING = {'G'=>:grass, 'C'=>:clover, 'R'=>:radishes, 'V'=>:violets}
  
  def initialize(rows) = @rows = rows.split

  def method_missing(name)
    if CHILDREN.include?(name.to_s)
      index = 2 * CHILDREN.index(name.to_s)
      @rows.map { |row| row[index..index+1] }
           .join.each_char.map { |char| ENCODING[char] }
    end
  end
end
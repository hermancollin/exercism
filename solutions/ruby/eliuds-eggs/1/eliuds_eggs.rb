module EliudsEggs
  def EliudsEggs.egg_count(n)
    n.to_s(2).each_char.count('1')
  end
end
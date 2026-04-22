module Year
  def Year.leap?(y)
    y % 4 == 0 and (not y % 100 == 0 or y % 400 == 0)
  end
end
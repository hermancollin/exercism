module Year
  def Year.leap?(year)
    year % 4 == 0 and (not year % 100 == 0 or year % 400 == 0)
  end
end
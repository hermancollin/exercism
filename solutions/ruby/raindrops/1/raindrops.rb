module Raindrops
  def Raindrops.convert(n)
    drops = ""
    drops += "Pling" if n % 3 == 0
    drops += "Plang" if n % 5 == 0
    drops += "Plong" if n % 7 == 0

    drops = n.to_s if drops == ""
    drops
  end
end
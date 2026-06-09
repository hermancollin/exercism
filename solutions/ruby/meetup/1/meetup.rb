require 'date'

class Meetup
  def initialize(m, y)
    @month = Date.new(y, m, 1)..Date.new(y, m, -1)
  end

  ORDINAL_TARGET = {first: 0, second: 1, third: 2, fourth: 3, last: -1}

  def day(wday, target)
    candidates = @month.select { _1.public_send("#{wday}?") }
    if ORDINAL_TARGET.key?(target)
      candidates[ORDINAL_TARGET[target]]
    else
      candidates.find {|date| (13..19).include?(date.day)}
    end
  end
end
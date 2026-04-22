module TwelveDays
  def self.song()
    song = ""
    second_block = ""
    content = [
      'twelve Drummers Drumming', 'eleven Pipers Piping', 'ten Lords-a-Leaping', 
      'nine Ladies Dancing', 'eight Maids-a-Milking', 'seven Swans-a-Swimming', 
      'six Geese-a-Laying', 'five Gold Rings', 'four Calling Birds', 'three French Hens', 
      'two Turtle Doves', 'a Partridge in a Pear Tree'
    ]
    n_th = [
      'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
      'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth'
    ].each.with_index do |nth, i|
      first_block = "On the #{nth} day of Christmas my true love gave to me: "
      if i == 0
        second_block = content[-1]
      elsif i == 1
        second_block = content[-2] + ', and ' + second_block
      else
        second_block = content[-i - 1] + ', ' + second_block
      end
      song << first_block + second_block + ".\n"
      song << "\n" if i != 11
    end
    song
  end
end

module Tournament
  def Tournament.tally(input)
    header = Tournament.create_line('Team', 'MP', 'W', 'D', 'L', 'P')
    return header if not input.include?(';')

    scores = Hash.new("")
    input.lines.each do |line|
      team1, team2, outcome = line.strip.split(';')
      case outcome
      when 'win'
        scores[team1] += 'w'
        scores[team2] += 'l'
      when 'loss'
        scores[team1] += 'l'
        scores[team2] += 'w'
      when 'draw'
        scores[team1] += 'd'
        scores[team2] += 'd'
      end
    end

    rows = scores.map do |team, score|
      w = score.scan('w').length
      l = score.scan('l').length
      d = score.scan('d').length
      mp = w + l + d
      p = 3 * w + d
      Tournament.create_line(team, mp.to_s, w.to_s, d.to_s, l.to_s, p.to_s)
    end
    rows.sort_by! { |row| row.strip.split('|')[0] }.reverse!  # sort alphabetically first
    rows.sort_by! { |row| row.strip.split('|')[-1] }.reverse! # then sort by score
    [header, *rows].join
  end

  def Tournament.create_line(name, match_played, won, drawn, lost, points)
    "#{"%-31s" % name}| #{"%2s" % match_played} | #{"%2s" % won} | #{"%2s" % drawn} | #{"%2s" % lost} | #{"%2s" % points}\n"
  end
end
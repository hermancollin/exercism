class FlowerField
  def self.annotate(rows)
    return rows if rows.empty?
    m, n = rows.length, rows[0].length
    debug m, n
    rows.each {|row| row.gsub!(" ", "0")}
    rows.each_with_index do |row, i|
      row.chars.each.with_index do |elem, j|
        if elem == "*"
          min_row = [i-1, 0].max
          max_row = [i+1, m-1].min
          min_col = [j-1, 0].max
          max_col = [j+1, n-1].min
          (min_row..max_row).each do |x|
            (min_col..max_col).each do |y|
              target = rows[x][y]
              next unless target in ("0".."9")
              rows[x][y] = (target.to_i + 1).to_s
            end
          end
        end
      end
    end
    
    rows.each { |row| row.gsub!("0", " ") }
  end
end

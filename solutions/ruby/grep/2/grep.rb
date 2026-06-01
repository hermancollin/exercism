module Grep
  def self.grep(pattern, flags, files)
    grepped = []
    pattern = pattern.downcase if flags.include?("-i")
    
    files.each do |file|
      File.foreach(file).with_index do |line, i|
        candidate = line.strip
        candidate.prepend("#{i + 1}:") if flags.include?("-n")
        candidate.prepend("#{file}:") if files.length > 1
        candidate = file if flags.include?("-l")
        line = line.strip.downcase if flags.include?("-i")
        match_found = line.match?(pattern)
        match_found = line.strip == pattern if flags.include?("-x")
        if match_found
          grepped << candidate unless flags.include?("-v")
          break if flags.include?("-l")
        else
          grepped << candidate if flags.include?("-v")
        end
      end
    end
    grepped.join("\n")
  end
end
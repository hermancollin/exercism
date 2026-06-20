module Grep
  def self.grep(pattern, flags, files)
    grepped = []
    
    file_mode = flags.include?("-l")
    inverse_mode = flags.include?("-v")
    ignore_case_mode = flags.include?("-i")
    pattern = pattern.downcase if ignore_case_mode
    
    files.each do |file|
      File.foreach(file).with_index do |line, i|
        candidate = line.strip
        candidate.prepend("#{i + 1}:") if flags.include?("-n")
        candidate.prepend("#{file}:") if files.length > 1
        candidate = file if file_mode
        line = line.strip.downcase if ignore_case_mode
        match_found = line.match?(pattern)
        match_found = line.strip == pattern if flags.include?("-x")
        if match_found
          grepped << candidate unless inverse_mode
          break if file_mode
        else
          grepped << candidate if inverse_mode
        end
      end
    end
    grepped.join("\n")
  end
end
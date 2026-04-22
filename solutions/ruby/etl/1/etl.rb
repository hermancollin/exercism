module ETL
  def self.transform(old_mapping)
    new_mapping = {}
    old_mapping.each do |value, letters|
      letters.each {|x| new_mapping[x.downcase] = value}
    end
    new_mapping
  end
end
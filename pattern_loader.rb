class PatternLoader

  def initialize(name)
    @pattern = name
  end

  def load
    File.open("examples/#{@pattern}") do |f|
      f.readlines.inject([]) do |map,line|
        row = line.split(" ").collect { |char| char == "." ? 0 : 1 } 
        map << row
      end
    end
  end
  
end

require 'colorize'

class WorldRenderer

  attr_accessor :world
  

  def initialize(world)
    @world =  world
    @live_cell =   "*".red
    @dead_cell = ".".black
  end

  def render
    system("clear")
    @world.map.each do |row|
      row.each do |cell|
        print @dead_cell if cell == 0
        print @live_cell  if cell == 1
        print " "
      end
      print "\n"  
    end
  end
  

end

class World

  attr_accessor :map

  def initialize(array)
    @map = array
  end

  def row_max
    @row_max = @row_max || @map.count
  end

  def col_max
    @col_max = @col_max || @map.first.count
  end
  

  def neighbours(row,col)
    [[0,1],[0,-1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1]].inject([]) do |result,offset|
      row_offset = (row + offset[0]) % row_max
      col_offset = (col + offset[1]) % col_max
      result << @map[row_offset][col_offset]
    end
  end

  def alive_neighbours(row,col)
    neighbours(row,col).select{|cell| cell == 1 }.count
  end

  def each_cell_with_index
    @map.each_with_index do |record,row|
      record.each_with_index do |_,col|
        yield row,col
      end
    end
  end

  def progress
    @next_map = array_clone
    each_cell_with_index do |row,col|
      alive = alive_neighbours(row,col)
      @next_map[row][col] = 0 if alive < 2
      @next_map[row][col] = 1 if alive == 3
      @next_map[row][col] = 0 if alive > 3
    end
    @map = @next_map
  end

  private

  # do a deep cloning of the world array
  def array_clone
    new_map = @map.inject([]) do |result,rows|
      result << rows.collect { |e| e}
    end
      
    
  end
  
end

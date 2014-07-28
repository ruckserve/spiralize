class Index
  attr_reader :test
  def initialize(max)
    @max = max
    @value = 0
    @forward = true
  end
  def next(switch=false)
    @forward ? @value += 1 : @value -= 1
    if switch || value <=0 || value >= @max-1
      @forward = !@forward 
      return true
    end
    return false
  end
  def value
    @test = @value
  end
  def testing(x=1)
    @test = @forward ? @value + x : (@value - x < 0 ? @max : @value - x)
  end
end

def spiral(h,w=nil)
  filler = 0
  flipper = 1
  w ||= h
  matrix = []
  h.times { matrix << Array.new.fill(filler,0,w) }
  x = Index.new(w)
  y = Index.new(h)
  increment = x
  while true
    matrix[y.value][x.value] = flipper
    switch = increment.next((increment.testing(3)) && ( !matrix[y.test].nil? && matrix[y.test][x.test] == flipper))
    break if switch && @last_switch
    @last_switch = switch
    increment = increment.value && increment == x ? y : x if switch
    break if increment.testing(2) && ( !matrix[y.test].nil? && matrix[y.test][x.test] == flipper)
  end
  matrix[y.value][x.value] = flipper
  matrix.each { |arr| print arr, "\n" }
end


spiral 13

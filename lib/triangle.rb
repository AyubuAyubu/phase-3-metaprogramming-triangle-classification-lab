class Triangle
  # write code here
    attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one,side_two, side_three)
    @side_one = side_one    
    @side_two = side_two    
    @side_three = side_three
  end
  
  #check if all sides are greater than 0
  def valid_num?
    [@side_one, @side_two, @side_three].all? { |num| num > 0}
  end

  def valid_triangle?
    @side_one + @side_two > @side_three && @side_two + @side_three > @side_one && @side_three + @side_one > @side_two
  end

  def kind
    check_error 
    if @side_one == @side_two && @side_two == @side_three
      :equilateral
    elsif @side_one == @side_two || @side_two == @side_three ||  @side_three == @side_one
      :isosceles
    else
      :scalene
    end
  end
  
  private
  def check_error
    raise TriangleError unless valid_num? && valid_triangle?
  end
  
  class TriangleError < StandardError
    # triangle error code
  end
end

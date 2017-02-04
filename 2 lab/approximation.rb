module Approximation
  def self.linear_interpolation(a,b,m,n, func)
    appr = "y1 +(x-x1)*(y2 -y1)/(x2-x1)"
    test_x = []
    (1..m).each { |i|  test_x << (a+(i-1)*(b-a)/(m-1).to_f) }
    test_fx = {}
    test_x.each { |x| test_fx[x] = eval(func) }
    quest_x =[]
    (1..20).each { |i|  quest_x << (a+i*(b-a)/20.0) }
    puts "f(x)\t\t\t\t\tappr(x)\t\t\t\t\tinaccuracy"
    puts "_"*101
    quest_x.each do |x|
      func_y = eval(func)
      index = test_x.index{|i| x<=i}
      x1, x2 = test_x[(index-1)..index]
      y1, y2 = test_fx[x1], test_fx[x2]
      appr_y = eval(appr)
      eps = (func_y - appr_y).abs
      puts"#{func_y}\t\t|\t#{appr_y}\t\t|\t#{eps}"
    end
  end
end
if __FILE__ == $0
  a, b, m, n = 5, 8, 11, 2
  func = "x**(0.5)+(Math.cos(x))**2"
  Approximation::linear_interpolation(a, b, m, n, func)
end

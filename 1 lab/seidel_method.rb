def seidel_method(a, b, eps, n=a[0].size)
  raise "The elements on the main diagonal is less than the sum of the remaining elements in the row" unless a.each_with_index.map{|x, i| x.inject(&:+)<=2*x[i]}.inject(:&)
  iterates = 1
  x = [0]*n
  e = [eps*2]*n
  while e.max > eps do
    temp = x.dup
    n.times do |i|
      sum = 0
      n.times do |j|
        if i!=j
          sum+=a[i][j]*x[j]
        end
      end
      x[i] = (-sum.to_f+b[i])/a[i][i].to_f
      e[i] = (temp[i] - x[i]).abs
    end
    iterates+=1
  end
  [iterates, x]
end

if __FILE__ == $0
  puts "Enter vector demension"
  n = gets.split(" ").first.to_i
  puts "ooook\nEnter vector epsilon"
  eps = gets.split(" ").first.to_f
  a=[[]]*n

  n.times do |i|
    puts "Enter #{n} elements in #{i+1} row  (write space between nums)"
    a[i] = gets.split(" ").map(&:to_i)[0...n]
  end

  puts "Enter vector b (write space between nums)"
  b = gets.split(" ").map(&:to_i)[0...n]

  puts seidel_method(a, b, eps)
end

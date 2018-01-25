# John Brock
# https://projecteuler.net/problem=38
# Pandigital Multiples
# 2018-01-23

# int -> bool
def pandigital_multiple?(n)
  return pandigital?(pandigitize(n))
end

# int -> bool
def pandigital?(n)
  return false if n < 123456789 || n > 987654321
  digit_array = n.digits
  1.upto(9) do |n|
    return false unless digit_array.include?(n)
  end
  true
end

# int -> int
# concatinate the products of k * (1..n)
# if k can't be pandigitized then return 0
def pandigitize(k)
  n = 1
  digit_array = []
  while digit_array.length < 9
    (n * k).digits.reverse.each { |d| digit_array.push(d) }
    n += 1
  end
  digit_array.join.to_i
end

def solve(limit)
  highest = 0
  1.upto(limit) do |k|
    if pandigital_multiple?(k)
      if pandigitize(k) > highest
        highest = pandigitize(k)
      end
    end
  end
  highest
end

start = Time.now
output = solve(9999)
finish = Time.now
puts output
puts finish - start
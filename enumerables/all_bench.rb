require "benchmark"

a_million_numbers_range = (1..1_000_000)
b_million_numbers_range = (-1_000_000..1)
a_million_numbers_array = (1..1_000_000).to_a
a_million_one_numbers_array = (1..1_000_000).to_a.push(-1)

n = 25
Benchmark.bm do |x|
  x.report { n.times { a_million_numbers_range.all?{|num| num > 0 } } }
  x.report { n.times { a_million_numbers_range.lazy.all?{|num| num > 0 } } }
  x.report { n.times { b_million_numbers_range.all?{|num| num < 0 } } }
  x.report { n.times { b_million_numbers_range.lazy.all?{|num| num < 0 } } }
  x.report { n.times { a_million_numbers_array.all?{|num| num > 0 } } }
  x.report { n.times { a_million_one_numbers_array.all?{|num| num > 0 } } }
end
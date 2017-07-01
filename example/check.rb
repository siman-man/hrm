Dir.glob("**/*.hrm").each do |filepath|
  name = File.basename(filepath, ".hrm")
  dirname = File.dirname(filepath)

  result = `hrm #{filepath} < #{File.join(dirname, "input")}`
  expect = File.read("#{File.join(dirname, "output")}")

  if result != expect
    puts "expect = #{expect.inspect}"
    puts "actual = #{result.inspect}"
    raise "Check failed!"
  end
end

puts "All test passed!!"

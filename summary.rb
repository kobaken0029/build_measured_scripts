require "date"

def read(filename)
  file=open(filename)
  result=file.read(100)
  file.close
  result
end

today=Date.today.strftime("%Y-%m%d")
file_path="logs/*/#{today}*/*.txt"

buf=`find #{file_path}`
array=buf.split("\n")

puts "========================="
puts "【本日のビルド】"
puts "ビルド回数: #{array.size}回"
puts "ビルド時間:"
results=array.map {|filename| read(filename).to_i }
results.each { |time| puts "#{time}s" }
sec=results.reduce(:+)
min=(sec/60.0).round(2)
hour=(min/60.0).round(2)
day=(hour/8.0).round(1)
puts "ビルド総時間: #{sec}s #{min}min #{hour}h #{day}day"
puts "========================="

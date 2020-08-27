def save_rank(name, total_points)
  content = "#{name}\n#{total_points}"
  File.write "rank.txt", content
end

def read_rank
content = File.read "rank.txt"
content.split "\n"
end
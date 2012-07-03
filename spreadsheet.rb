require "rubygems"
# see https://github.com/gimite/google-drive-ruby
require "google_drive"

# Logs in.
# You can also use OAuth. See document of
# GoogleDrive.login_with_oauth for details.
file = File.new("key")
user = file.gets.chomp
password = file.gets.chomp
session = GoogleDrive.login(user, password)
puts session.inspect

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
#ws = session.spreadsheet_by_key("pz7XtlQC-PYx-jrVMJErTcg").worksheets[0]

#https://docs.google.com/spreadsheet/ccc?key=0AnC3py1C1o3wdC0tUWNEYjB0UVJOV0Q3N3dRek05LUE#gid=1
ws = session.spreadsheet_by_key("0AnC3py1C1o3wdC0tUWNEYjB0UVJOV0Q3N3dRek05LUE").worksheets[0]
puts ws.inspect

# Gets content of A2 cell.
p ws[2, 1]  #==> "hoge"

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
ws[5, 1] = "casiano"
ws[5, 2] = "juana"
ws.save()

# Dumps all cells.

puts "numrows = #{ws.num_rows}"
puts "numcols = #{ws.num_cols}"
for row in 1..ws.num_rows
  for col in 1..ws.num_cols
    print "%-5s " % [ws[row, col]]
  end
  puts ""
end

# Yet another way to do so.
#p ws.rows  #==> [["fuga", ""], ["foo", "bar]]
ws.rows.each do |r|
  r.each do |e|
    print "%-10s " % [ e ] 
  end
  puts ""
end

# Reloads the worksheet to get changes by other clients.
#ws.reload()
